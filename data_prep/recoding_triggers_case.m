% SUMMARY: This script converts all event triggers in data set and converts
% them to numerics so they can be used by ADAM. It also removes events of
% type 80, 81, and 82. This on work for a single condition, for a single
% subject. This means, left/right saccade and left/right jumps can be
% examined.
%
% INPUT: dssd_divided, flipped_files
%
% OUTPUT: Outputs to "Data/recoded_files"
%
% USAGE: variable 'k' codes for subject id. It can be set single (k=1),
% multiple ( k = 1:5 ), or all subjects ( k = 1:19)
% 
% 'n' codes for conditions to process, and can be selected similiarly.
% n=1 "Correct Rejection", n=2 "False Alarm", n=3 "Hit", and n=4 "Miss"
%
% Made by: Jonathan Giordano
% Combined with part of Mehdi Senoussi's script:
% "sacc_disp_recoding_triggers.m"
% Date: January 14, 2019
%

%Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";
home = pwd;

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it
for k=1:1
    
    %Skip missing subjects 12, 17
    if (k == 12 ) || (k == 17)
        continue
    end
    
    %Loop through each of the 4 conditions CR, FA, Hit, Miss
    %CR = 1, FA = 2, Hit = 3, Miss = 4
    for n=1:4
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, filename is of form '01cr.set'
                
        % WINDOWS
        EEG = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
        
        % how many events were there in that EEG dataset
        n_event = length(EEG.event);

        %% Apparently this recoding section isn't necessary for Single Subject Analysis for Accuracy
        % loop across all events
%         for event_i = 1:n_event
%             % get the trigger "label"/"type" and only keep the numerical part
%             temp = str2num(EEG.event(event_i).type(3:end));
%             % store the 
%             EEG.event(event_i).type = temp;
%             EEG.event(event_i).code = temp;
%         end

        % same thing but with the triggers stored in the epoch field of the EEGlab
        % structure
        %%
        
        n_epoch = length(EEG.epoch);
        for epoch_i = 1:n_epoch
            temp = {};
            for ev_n = 1:length(EEG.epoch(epoch_i).eventtype)
                a = char(EEG.epoch(epoch_i).eventtype(1)); %Tricking to only take the first value and copy over 2nd
                temp{ev_n} = str2num(a(3:end));
            end
            EEG.epoch(epoch_i).eventtype = temp;
        end
        
        %This code goes in the above loop to remove 81,82 and reduce
        %EEG.Epoch(x).eventype to a single value
        %
        % a = char(EEG.epoch(epoch_i).eventtype(1));
        % temp = str2num(a(3:end));
        %
        
        %Convert to .SET file and Save
        title = sprintf('%02d%s_recoded',k,con(n)); %Create title for plots
        
        %WINDOWS
        EEG = pop_saveset(EEG, title, strcat(home, '\data\recoded_files'));

        %MAC
        %EEG = pop_saveset(EEG, title, strcat(home, '/data/recoded_files'));
    end
end