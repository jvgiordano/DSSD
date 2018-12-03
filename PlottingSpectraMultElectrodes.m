%This script plot the time-frequency analysis of multiple electrodes
%combined
%
%
%Made by: Jonathan Giordano
%November 15, 2018
%
%

%% Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";

%% Create Variables for Averaging
chan = [46 47 48]; %Select channels to measure with this variable of form (X Y Z)
interval_avg = zeros(19,2); %Creates array of zeros for storing averages

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it

%% Comptuing averages

for k=1:19
    
    %Skip missing subjects 12, 17
    if (k == 12 ) || (k == 17)
        continue
    end
    
    %Loop through each of the 4 conditions CR, FA, Hit, Miss
    for n=1:4
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, create filename of form '01cr.set'
        chan2 = sprintf('%.f-',chan);
        chan2 = chan2(1:end-1);
        title = sprintf('Subject %02d - %s - Electrode(s) %s',k,condition(n),chan2); %Create Title for plots
        % For PC
        % EEG = pop_loadset('filename',doc,'filepath','C:\\Users\\jonny\\Desktop\\Stage\\dssd_divided\\');
        
        % For Mac
        EEG = pop_loadset('filename',doc,'filepath','/Volumes/JVG_USB/Stage/dssd_divided/');
        
        EEG = eeg_checkset( EEG );
                     
        
        data = ChanAvg(EEG,chan) %Call function to select channels and average them
        
        figure; pop_newtimef( data, 1, 1, [-200  598], [3 0.5] , ...
            'caption', title, 'baseline',[0], 'plotitc' , 'off', 'plotphase', 'off', 'padratio', 1, 'winsize', 100);
        
        %For Saving Figures
        %title = sprintf('Subject %02d - %s - Electrode(s) %s.fig',k,condition(n),chan2);
        %savefig(title);
             
    end
end

   
