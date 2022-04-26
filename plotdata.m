function plotdata(dep)
%% select what to plot


 

dependent = dep;



%% load outputs
cd 'C:\Users\tommy\OneDrive\Documents\Scripts and Data for Tommy\Tommy\Output Data'

d= dir('*mat');
 dd = zeros(length(d),1);
 for j = 1:length(d)
  dd(j) =d(j).datenum;
 end
 [tmp i] = max(dd);
 file = load(d(i).name);
 output = file.output;

 cd 'C:\Users\tommy\OneDrive\Documents\Scripts and Data for Tommy\Tommy\'
    
 pharmacology = {'K+', 'gabazine'};

%%
    plotAgainstConc(dependent, output);
    
 % plotAgainstGabazine(dependent, output);





