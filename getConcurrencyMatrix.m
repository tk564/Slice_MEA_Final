function getConcurrencyMatrix(file, fileName, CA1layers, t1, t2)

%% load the structs for each region
%combinedSpikes = loadRegionalSpikes(fileName, CA1layers);
% in order DG, CA1o, CA1p, CA1r, CA1m, CA3, EC

%spikes = combinedSpikes; % atm still just doing with combined spikes - i dont see a way of making it work otherwise, explain to Rich
% two possible methods - either only include the maximum amplitude channel
% for each ~2ms period

%spikes = primaryofsubfield(spikes, file, CA1layers, fileName);

try
datafiles = dir(strcat(fileName(1:11), '*', '_finalData_6.mat'));
finalData = load(datafiles.name);
finalData = finalData.finalData;

spikefiles = dir(strcat(fileName(1:11), '*', 'Spikes_6.mat'));
spikefiles = spikefiles(~contains({spikefiles.name},'su'));
spikeMatrix = load(spikefiles.name);
spikeMatrix = spikeMatrix.spikeMatrix;

recref.name = fileName;
HPCelectrodes = getHPCelectrodes(recref);
for i = 1:size(spikeMatrix,2)
    if nnz(i == HPCelectrodes) == 0
        spikeMatrix(:,i) = 0;
    end
end


ampMatrix = finalData.*spikeMatrix;


% for each subfield, only select the highest amplitude electrode at any one
% timepoint i.e. within 3ms of eachother (at 5ms we might imagine some
% inter-region communication emerging..., but play around with)
topfield = [3 12 29 13 6 11 20 4 5 21 14 2 51 44 60 61 45 22 10 59 52 36 53 7];
leftfield = [26 17 19 1 25 27 18 9 43 25 27 18 9 43 28 34 41 49 57 33 35 42 50 58];
rightfield = [8 15 16 23 24 30 31 62 63 64 46 48 39 32 54 55 56 47 38 40 37];

maxMatrix = zeros(size(ampMatrix));
ampMatrix = full(ampMatrix);
w=6;
maxMatrix = onlyMaxElectrode(topfield, maxMatrix, ampMatrix,w);
maxMatrix = onlyMaxElectrode(leftfield,maxMatrix,ampMatrix,w);
maxMatrix = onlyMaxElectrode(rightfield, maxMatrix, ampMatrix,w);

%% combine into supregions


spikes = combineRegionals(fileName, maxMatrix, CA1layers);

%avgAmp = checkSameSpike(finalData, spikeMatrix);

%% get the concurrent matrix

adjacencyMatrix = zeros(size(spikes,2), size(spikes,2));

for i = 1:size(spikes,2)

    for j = 1:size(spikes,1)

        if spikes(j,i) == 1 % if a spike occurs in this region

            for k = 1:size(spikes,2) % goes through all regions

                if nnz(spikes(j+t1:j+t2,k)) > 0 % concurrency window of 1-10ms, ask Rich but 10ms previously recommended by Tanja as used in STDP experiments

                    adjacencyMatrix(i,k) = adjacencyMatrix(i,k)+1; % adds 1 to the weight for region i communicating to region k
                   
                end
            end
        end
    end
end
%% compare against randomised control

N = sum(spikes); % spikes per region
C = nnz(sum(spikes)); % active regions
L = length(spikes);
 aj = zeros(size(adjacencyMatrix));
for o = 1:200
    
    aModel = zeros(size(adjacencyMatrix));

modelMatrix = zeros(L,C);
for i = 1:C
    for j = 1:N
         x = round(rand*L);
         modelMatrix(x,i) = 1;
         if x > L-201
         modelMatrix(x+1:x+200,i) = 0;
         end
    end
end

model = modelMatrix;

    for i = 1:size(model,2)

    for j = 1:size(model,1)

        if model(j,i) == 1 % if a spike occurs in this region

            for k = 1:size(model,2) % goes through all regions

                if nnz(model(j+t1:j+t2,k)) > 0 % concurrency window of 1-10ms, ask Rich but 10ms previously recommended by Tanja as used in STDP experiments

                    aModel(i,k) = aModel(i,k)+1; % adds 1 to the weight for region i communicating to region k
                   
                end
            end
        end
    end
    end

   aj = aj+aModel; 
end

ifrandom = aj / 200;


adjacencyMatrix = adjacencyMatrix - ifrandom;

adjacencyMatrix = adjacencyMatrix.*(adjacencyMatrix > 0);








%%
% get digraph
for i = 1:length(adjacencyMatrix)
    adjacencyMatrix(i,i) = 0;
end


if nnz(adjacencyMatrix) > 0
    if CA1layers == 1
        G = digraph(adjacencyMatrix, ...
            {'DG', 'CA1 oriens', 'CA1 pyramidale', 'CA1 radiatum', 'CA1 moleculare', 'CA3', 'EC'}, ...
            'omitselfloops');
        % img = imread('slice pic example.jpg');
        % img = flip(img);
        % fig1 = image('CData',img,'XData',[4 8],'YData',[-1/4 1/4]);
        
        
        x = [60, 60, 60, 60, 60, 50, 70];
        y = [-10, 20, 15, 10, 5, 0, 0];

    else
        G = digraph(adjacencyMatrix,...
            {'DG', 'CA1', 'CA3', 'EC'}, ...
            'omitselfloops');
         % img = imread('slice pic example.jpg');
        % img = flip(img);
        % fig1 = image('CData',img,'XData',[4 8],'YData',[-1/4 1/4]);
        % hold on
    
        x = [58, 60, 50.5, 72.5];
        y = [-9, 9, 0, 0];
    end
    
    fig = plot(G, ...
    'XData', x, 'YData', y,...
        'LineWidth', G.Edges.Weight/(max(G.Edges.Weight)/3), ...
        'EdgeLabel', G.Edges.Weight);
        
        hold on
        aesthetics
        
        title({'Concurrency Plot with Potential IIS Communication for', fileName(1:length(fileName)-29)});
        
        saveas(fig, strcat(fileName(1:length(fileName)-29), '_concurrency_plot.png'))
        save(strcat(fileName(1:length(fileName)-29), '_adjacency_matrix.mat'), "adjacencyMatrix");
        close 
       clear fig adjacencyMatrix
end
catch
    
end








