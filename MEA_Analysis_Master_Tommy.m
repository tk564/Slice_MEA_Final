% overall master script for MEA analysis

clear; close all


%diary(strcat('Command  window log ', date, '.txt'));
tic
recording_refs = {'20170820004'}; % change me to references you want analysed

redetect = 0;
reanalysis = 1; % toggle to re or not reanalyse already analysed data


%% produce the spike matrix

% first run the initial analysis script chain to produce the tSpikes files


for r = 1:size(recording_refs,2)
    MED_Analysis_Tommy(recording_refs{r}, redetect); % runs separately from analysis so that analyses can output to different folder if desired



    data_and_scripts_dir = 'C:\Users\tommy\OneDrive\Documents\Scripts and Data for Tommy\Tommy'; % Changed to a directory containing both your scripts and files.
    cd(data_and_scripts_dir)

    %% analyse the spike` matrix
    % LOAD FILES

    tSpikeFiles = dir(strcat('*', recording_refs{r}, '*', 'Spikes_*.mat')); % Loads all files in the directory from a given culture preparation
    tSpikeFiles = tSpikeFiles(~contains({tSpikeFiles.name}, 'analysed')); % Removes analysed files.
    tSpikeFiles = tSpikeFiles(~contains({tSpikeFiles.name}, 'concurrency')); % Removes analysed files.
    % runs downstream analysis and produces the output struct with any data
    % gathered. Update the output variables as more are added

    for f = 1:length(tSpikeFiles)

        try
        [data, channels, file, finalData, thresholds, exclude] = getSpikeFiles(f, tSpikeFiles, recording_refs{r}, reanalysis);

        if exclude ~= 1 % does not analyse if is in the exclusion list for whatever reason
            [analysedSpikes, spikesTot, fullData, interictalData, ~, ~, tSpikeConcurrents,channels,concurrencyNetwork, signalToNoise, combinedSpikes, energy, ampdata] = tSpikeAnalysis_Tommy(data, channels, file, finalData, thresholds);

    
            fileName = strcat(file.name(1:length(file.name)-4), '_analysed', '.mat');
            save(fileName, 'analysedSpikes', 'spikesTot', 'fullData', 'interictalData', 'tSpikeConcurrents','channels','concurrencyNetwork', 'signalToNoise', 'combinedSpikes', 'energy', 'ampdata');


            HCregionalAnalysis(file, data, channels, finalData, thresholds);
        end
        catch
            disp(strcat('error with', " ", recording_refs{r}, " ", 'analysis'));
        end


    end
end
%%

%concurrencyAnalysis


%outputData; % finally outputs the data

toc
%diary('off');
