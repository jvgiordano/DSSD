% SUMMARY: Script flips all mirrored electrodes across the logitudinal
% fissure line for all trials marked by a left saccade. This changes the
% model from left-right one to a forwards-backwards model. If the saccadic
% target jumps to the "right", this is a "forward" jump. If the saccadic
% target jumps to the "left", this is a "backwards" jump.
%
% INPUT: dssd_divided
%
% OUTPUT: all files under "flipped_files"
%
% USAGE: variable 'k' codes for subject id. It can be set single (k=1),
% multiple ( k = 1:5 ), or all subjects ( k = 1:19)
% 
% 'n' codes for conditions to process, and can be selected similiarly.
% n=1 "Correct Rejection", n=2 "False Alarm", n=3 "Hit", and n=4 "Miss"
%
% NOTE: This file requires the function "Convert_To_FB.m" 
%
% Made by: Jonathan Giordano
% December 10, 2018
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
    %CR = 1, FA = 2, Hit = 3, Miss = 4
    for n=1:4
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, filename is of form '01cr.set'
                
        % WINDOWS
        tEEG = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
                
        % MAC
        % tEEG = pop_loadset('filename',doc,'filepath',strcat(home, '/data/dssd_divided'));

        %Flip the data
        tEEG = Convert_To_FB(tEEG);
        
        %Convert to .SET file and Save
        title = sprintf('%02d%s',k,con(n)); %Create filename
        
        %WINDOWS
        EEG = pop_saveset(tEEG, title, strcat(home, '\data\flipped_files'));
        
        %MAC
        %EEG = pop_saveset(tEEG, title, strcat(home, '/data/flipped_files'));

        
    end
            
           
end

