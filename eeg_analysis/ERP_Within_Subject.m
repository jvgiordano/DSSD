% SUMMARY: This script produces ERP Averages for selected conditions and
% selected subjects.
%
% INPUT: dssd_divided, flipped files
%
% OUTPUT: Results will be plotted
%
% USAGE: variable 'k' codes for subject id. It can be set single (k=1),
% multiple ( k = 1:5 ), or all subjects ( k = 1:19)
% 
% 'n' codes for conditions to process, and can be selected similiarly.
% n=1 "Correct Rejection", n=2 "False Alarm", n=3 "Hit", and n=4 "Miss"
%
% Made by: Jonathan Giordano
% November 4, 2018
%
%

%Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";
home = pwd;

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
        
        % WINDOWS
        EEG = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
                
        % MAC
%       EEG = pop_loadset('filename',doc,'filepath',strcat(home, '/data/dssd_divided'));
%       
         
        EEG = eeg_checkset( EEG );
        figure(); pop_timtopo(EEG, [-200  598], [NaN], title);
        
        %For saving figures
        title = sprintf('ERP Data - Subject %02d - %s.fig',k,condition(n)); %Create Title for plots
        
        %To save figure to home directory
        %home = pwd;
        
        %savefig(title);
        
    end
end