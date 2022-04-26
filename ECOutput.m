function output = ECOutput(file, data, output)

 output(file).EC__signalToNoise = data.signalToNoise;

    %% full data ouptut
   
        output(file).EC__spikesTot_full = data.fullData.spikesTot_full;

         try
        output(file).EC__energyMean = data.energy.energyMean;
        output(file).EC__energyMean2 = data.energy.energyMean2;
        output(file).EC__energyMean3 = data.energy.energyMean3;
     

        output(file).EC__ampMean = data.ampdata.ampMean;
        output(file).EC__ampMax = data.ampdata.ampMax;
        output(file).EC__ampUQ = data.ampdata.ampUQ;
%         output(file).EC__ampMedian = data.ampdata.ampMedian;
        output(file).EC__ampLQ = data.ampdata.ampLQ;
        output(file).EC__ampMin = data.ampdata.ampMin;
        output(file).EC__ampSTD = data.ampdata.ampSTD;
        output(file).EC__ampSEM = data.ampdata.ampSEM;

        catch
            output(file).energyMean = 0;
        output(file).energyMean2 = 0;
        output(file).energyMean3 = 0;
     

        output(file).EC__ampMean =0;
        output(file).EC__ampMax = 0;
        output(file).EC__ampUQ = 0;
%         output(file).EC__ampMedian = 0;
        output(file).EC__ampLQ = 0;
        output(file).EC__ampMin = 0;
        output(file).EC__ampSTD = 0;
        output(file).EC__ampSEM = 0;
        end
    
        %output(file).EC__spikesPerChannel_full = num2str(data.fullData.spikesPerChannel_full);
        
        %output(file).EC__freqPerChannel_Hz_full = num2str(data.fullData.frequencyData.freqPerChannel_Hz);
    
        output(file).EC__freqMean_Hz_full = data.fullData.frequencyData_full.freqMean_Hz;
        output(file).EC__freqSTD_Hz_full = data.fullData.frequencyData_full.freqSTD_Hz;
        output(file).EC__freqSEM_Hz_full = data.fullData.frequencyData_full.freqSEM_Hz;
        
        output(file).EC__freqMaxFiringChannel_Hz_full = data.fullData.frequencyData_full.freqMaxFiringChannel_Hz;
        output(file).EC__freqUQFiringChannel_Hz_full = data.fullData.frequencyData_full.freqUQFiringChannel_Hz;
        output(file).EC__freqMedianFiringChannel_Hz_full = data.fullData.frequencyData_full.freqMedianFiringChannel_Hz;
        output(file).EC__freqLQFiringChannel_Hz_full = data.fullData.frequencyData_full.freqLQFiringChannel_Hz;
        output(file).EC__freqMinFiringChannel_Hz_full = data.fullData.frequencyData_full.freqMinFiringChannel_Hz;
    
        output(file).EC__freqSTDBetweenChannels_Hz_full = data.fullData.frequencyData_full.freqSTDBetweenChannels_Hz;
        output(file).EC__freqSEMBetweenChannels_Hz_full = data.fullData.frequencyData_full.freqSEMBetweenChannels_Hz;
    
        %output(file).EC__spikeIntervalMeanPerChannel_s_full = num2str(data.fullData.spikeIntervalData_full.spikeIntervalMeanPerChannel_s);
        %output(file).EC__spikeIntervalSTDPerChannel_s_full = num2str(data.fullData.spikeIntervalData_full.spikeIntervalSTDPerChannel_s);
        %output(file).EC__spikeIntervalSEMPerChannel_s_full = num2str(data.fullData.spikeIntervalData_full.spikeIntervalSEMPerChannel_s);
        
        output(file).EC__spikeIntervalMean_s_full = data.fullData.spikeIntervalData_full.spikeIntervalMean_s;
        output(file).EC__spikeIntervalSTD_s_full = data.fullData.spikeIntervalData_full.spikeIntervalSTD_s;
        output(file).EC__spikeIntervalSEM_s_full = data.fullData.spikeIntervalData_full.spikeIntervalSEM_s;
    
        output(file).EC__spikeIntervalSTDBetweenChannels_s_full = data.fullData.spikeIntervalData_full.spikeIntervalSTDBetweenChannels_s;    
        output(file).EC__spikeIntervalSEMBetweenChannels_s_full = data.fullData.spikeIntervalData_full.spikeIntervalSEMBetweenChannels_s;
    

    %% active data output
     % for most recent analysis accidentally called all the active for
    % regionals midfifty, can just say this instead as a workaround for
    % now...
    output(file).EC__spikesTot_active = data.midfiftyData.spikesTot_full;

    %output(file).EC__spikesPerChannel_active = num2str(data.full.spikesPerChannel_active);

    %output(file).EC__freqPerChannel_Hz_active = num2str(data.full.frequencyData.freqPerChannel_Hz_active);

    output(file).EC__freqMean_Hz_active = data.midfiftyData.frequencyData_full.freqMean_Hz;
    output(file).EC__freqSTD_Hz_active = data.midfiftyData.frequencyData_full.freqSTD_Hz;
    output(file).EC__freqSEM_Hz_active = data.midfiftyData.frequencyData_full.freqSEM_Hz;
    
    output(file).EC__freqMaxFiringChannel_Hz_active = data.midfiftyData.frequencyData_full.freqMaxFiringChannel_Hz;
    output(file).EC__freqUQFiringChannel_Hz_active = data.midfiftyData.frequencyData_full.freqUQFiringChannel_Hz;
    output(file).EC__freqMedianFiringChannel_Hz_active = data.midfiftyData.frequencyData_full.freqMedianFiringChannel_Hz;
    output(file).EC__freqLQFiringChannel_Hz_active = data.midfiftyData.frequencyData_full.freqLQFiringChannel_Hz;
    output(file).EC__freqMinFiringChannel_Hz_active = data.midfiftyData.frequencyData_full.freqMinFiringChannel_Hz;

    output(file).EC__freqSTDBetweenChannels_Hz_active = data.midfiftyData.frequencyData_full.freqSTDBetweenChannels_Hz;
    output(file).EC__freqSEMBetweenChannels_Hz_active = data.midfiftyData.frequencyData_full.freqSEMBetweenChannels_Hz;

    %output(file).EC__spikeIntervalMeanPerChannel_s_active = num2str(data.midfiftyData.spikeIntervalData_full.spikeIntervalMeanPerChannel_s);
    %output(file).EC__spikeIntervalSTDPerChannel_s_active = num2str(data.midfiftyData.spikeIntervalData_full.spikeIntervalSTDPerChannel_s);
    %output(file).EC__spikeIntervalSEMPerChannel_s_midfufty = num2str(data.midfiftyData.spikeIntervalData_full.spikeIntervalSEMPerChannel_s);
    
    output(file).EC__spikeIntervalMean_s_active = data.midfiftyData.spikeIntervalData_full.spikeIntervalMean_s;
    output(file).EC__spikeIntervalSTD_s_midfufty = data.midfiftyData.spikeIntervalData_full.spikeIntervalSTD_s;
    output(file).EC__spikeIntervalSEM_s_midfufty = data.midfiftyData.spikeIntervalData_full.spikeIntervalSEM_s;

    output(file).EC__spikeIntervalSTDBetweenChannels_s_active = data.midfiftyData.spikeIntervalData_full.spikeIntervalSTDBetweenChannels_s;    
    output(file).EC__spikeIntervalSEMBetweenChannels_s_active = data.midfiftyData.spikeIntervalData_full.spikeIntervalSEMBetweenChannels_s;

%     %% stable period
% 
%     output(file).EC__spikesTot_stable = data.stableData.spikesTot_stable;
% 
%     %output(file).EC__spikesPerChannel_stable = num2str(data.stableData.spikesPerChannel_stable);
% 
%     %output(file).EC__freqPerChannel_Hz_stable = num2str(data.stableData.frequencyData_stable.freqPerChannel_Hz_stable);
% 
%     output(file).EC__freqMean_Hz_stable = data.stableData.frequencyData_stable.freqMean_Hz;
%     output(file).EC__freqSTD_Hz_stable = data.stableData.frequencyData_stable.freqSTD_Hz;
%     output(file).EC__freqSEM_Hz_stable = data.stableData.frequencyData_stable.freqSEM_Hz;
%     
%     output(file).EC__freqMaxFiringChannel_Hz_stable = data.stableData.frequencyData_stable.freqMaxFiringChannel_Hz;
%     output(file).EC__freqUQFiringChannel_Hz_stable = data.stableData.frequencyData_stable.freqUQFiringChannel_Hz;
%     output(file).EC__freqMedianFiringChannel_Hz_stable = data.stableData.frequencyData_stable.freqMedianFiringChannel_Hz;
%     output(file).EC__freqLQFiringChannel_Hz_stable = data.stableData.frequencyData_stable.freqLQFiringChannel_Hz;
%     output(file).EC__freqMinFiringChannel_Hz_stable = data.stableData.frequencyData_stable.freqMinFiringChannel_Hz;
% 
%     output(file).EC__freqSTDBetweenChannels_Hz_stable = data.stableData.frequencyData_stable.freqSTDBetweenChannels_Hz;
%     output(file).EC__freqSEMBetweenChannels_Hz_stable = data.stableData.frequencyData_stable.freqSEMBetweenChannels_Hz;
% 
%     %output(file).EC__spikeIntervalMeanPerChannel_s_stable = num2str(data.stableData.spikeIntervalData_stable.spikeIntervalMeanPerChannel_s);
%     %output(file).EC__spikeIntervalSTDPerChannel_s_stable = num2str(data.stableData.spikeIntervalData_stable.spikeIntervalSTDPerChannel_s);
%     %output(file).EC__spikeIntervalSEMPerChannel_s_stable = num2str(data.stableData.spikeIntervalData_stable.spikeIntervalSEMPerChannel_s);
%     
%     output(file).EC__spikeIntervalMean_s_stable = data.stableData.spikeIntervalData_stable.spikeIntervalMean_s;
%     output(file).EC__spikeIntervalSTD_s_stable = data.stableData.spikeIntervalData_stable.spikeIntervalSTD_s;
%     output(file).EC__spikeIntervalSEM_s_stable = data.stableData.spikeIntervalData_stable.spikeIntervalSEM_s;
% 
%     outout(file).spikeIntervalSTDBetweenChannels_s_stable = data.stableData.spikeIntervalData_stable.spikeIntervalSTDBetweenChannels_s;    
%     output(file).EC__spikeIntervalSEMBetweenChannels_s_stable = data.stableData.spikeIntervalData_stable.spikeIntervalSEMBetweenChannels_s;
%     
% 
%     %% highest spiking 60s
% 
%     output(file).EC__spikesTot_sixty = data.sixtyData.spikesTot_sixty;
%     
%         %output(file).EC__spikesPerChannel_sixty = num2str(data.sixtyData.spikesPerChannel_sixty);
%         
%         %output(file).EC__freqPerChannel_Hz_sixty = num2str(data.sixtyData.frequencyData.freqPerChannel_Hz);
%     
%         output(file).EC__freqMean_Hz_sixty = data.sixtyData.frequencyData_sixty.freqMean_Hz;
%         output(file).EC__freqSTD_Hz_sixty = data.sixtyData.frequencyData_sixty.freqSTD_Hz;
%         output(file).EC__freqSEM_Hz_sixty = data.sixtyData.frequencyData_sixty.freqSEM_Hz;
%         
%         output(file).EC__freqMaxFiringChannel_Hz_sixty = data.sixtyData.frequencyData_sixty.freqMaxFiringChannel_Hz;
%         output(file).EC__freqUQFiringChannel_Hz_sixty = data.sixtyData.frequencyData_sixty.freqUQFiringChannel_Hz;
%         output(file).EC__freqMedianFiringChannel_Hz_sixty = data.sixtyData.frequencyData_sixty.freqMedianFiringChannel_Hz;
%         output(file).EC__freqLQFiringChannel_Hz_sixty = data.sixtyData.frequencyData_sixty.freqLQFiringChannel_Hz;
%         output(file).EC__freqMinFiringChannel_Hz_sixty = data.sixtyData.frequencyData_sixty.freqMinFiringChannel_Hz;
%     
%         output(file).EC__freqSTDBetweenChannels_Hz_sixty = data.sixtyData.frequencyData_sixty.freqSTDBetweenChannels_Hz;
%         output(file).EC__freqSEMBetweenChannels_Hz_sixty = data.sixtyData.frequencyData_sixty.freqSEMBetweenChannels_Hz;
%     
%         %output(file).EC__spikeIntervalMeanPerChannel_s_full = num2str(data.fullData.spikeIntervalData_full.spikeIntervalMeanPerChannel_s);
%         %output(file).EC__spikeIntervalSTDPerChannel_s_full = num2str(data.fullData.spikeIntervalData_full.spikeIntervalSTDPerChannel_s);
%         %output(file).EC__spikeIntervalSEMPerChannel_s_full = num2str(data.fullData.spikeIntervalData_full.spikeIntervalSEMPerChannel_s);
%         
%         output(file).EC__spikeIntervalMean_s_sixty = data.sixtyData.spikeIntervalData_sixty.spikeIntervalMean_s;
%         output(file).EC__spikeIntervalSTD_s_sixty = data.sixtyData.spikeIntervalData_sixty.spikeIntervalSTD_s;
%         output(file).EC__spikeIntervalSEM_s_sixty = data.sixtyData.spikeIntervalData_sixty.spikeIntervalSEM_s;
%     
%         output(file).EC__spikeIntervalSTDBetweenChannels_s_sixty = data.sixtyData.spikeIntervalData_sixty.spikeIntervalSTDBetweenChannels_s;    
%         output(file).EC__spikeIntervalSEMBetweenChannels_s_sixty = data.sixtyData.spikeIntervalData_sixty.spikeIntervalSEMBetweenChannels_s;
%     