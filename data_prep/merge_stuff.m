% For this script to work you need to change your directory to the folder
% containing all your subjects folders (1, 2, 3, etc.) or adapt the script
% to your folder structure.
%
% This script takes data froom dssd_divided and merges all the cases from a
% single subject. It labels these cases by replacing the
% EEG.epoch.eventtype with 1, 2, 3, 4 (CR, FA, Hit, Miss).
%
% The output is stored in Data/Recoded files with "_all." ending.
%
%
% Created by: Mehdi Senoussi
% Edited to work with current set-up : Jonathan Giordano
% Data January 30, 2019
%
%

trial_types = ["cr", "fa", "hit", "miss"];
home = pwd;
labels = [];

% loop over all subjects
for subject_n = 1:2
    % create the data directory path
    data_dir = ['./', num2str(subject_n), '/'];
    % loop over the types of trials: hits, false alarms, etc.
    for trial_type_ind = 1:4

        doc = sprintf('%02d%s.set',subject_n,trial_types(trial_type_ind)); %sprintf must be used for newer Matlab versions, filename is of form '01cr.set'
        tmp = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
        
        %Create "labels" array, 
        x = size(tmp.data);
        tlabels = trial_type_ind*ones([1,x(3)]); %Set condition by number, CR = 1, FA = 2, Hit = 3, Miss = 4
        labels = [labels tlabels];
        % if this is the first dataset loaded then store it otherwise
        % concatenate it with the previous ones
        if trial_type_ind==1; TMPEEG=tmp;
        else TMPEEG=pop_mergeset(TMPEEG, tmp, 0);
        end
        tlabels = [];
    end
    
    %Write over Epochs with new labels
    n_epoch = length(TMPEEG.epoch);
    for epoch_i = 1:n_epoch
        TMPEEG.epoch(epoch_i).eventtype(2) = num2cell(labels(epoch_i)); %replace event types CR = 1, FA = 2, Hit = 3, Miss = 4 
    end
    
    % save the whole dataset
    data_dir = strcat(home, '\data\recoded_files')
    eegset_all = pop_saveset(TMPEEG,'filename', sprintf('%02i_all.set',...
        subject_n), 'filepath', data_dir);
    labels = [];
    
end