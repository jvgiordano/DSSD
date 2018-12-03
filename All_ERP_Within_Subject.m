%This script produces ERP Averages for all conditions and subjects
%
%Made by: Jonathan Giordano
%November 4, 2018
%
%

%Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it
for k=1:19
    
    %Skip missing subjects 12, 17
    if (k == 12 ) || (k == 17)
        continue
    end
    
    %Loop through each of the 4 conditions CR, FA, Hit, Miss
    for n=1:4
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, filename is of form '01cr.set'
        title = sprintf('ERP Data - Subject %02d - %s',k,condition(n)); %Create Title for plots
        % For PC
        % EEG = pop_loadset('filename',doc,'filepath','C:\\Users\\jonny\\Desktop\\Stage\\dssd_divided\\');
        % For Mac
        EEG = pop_loadset('filename',doc,'filepath','/Volumes/JVG_USB/Stage/dssd_divided/');
        EEG = eeg_checkset( EEG );
        figure(); pop_timtopo(EEG, [-200  598], [NaN], title);
        
        %For saving figures
        title = sprintf('ERP Data - Subject %02d - %s.fig',k,condition(n)); %Create Title for plots
        savefig(title);
        
    end
end