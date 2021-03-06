% SUMMARY: This script calculates the number of epochs containting the 'S
% 7X' (X = 0,1,2) and removes them from the data
%
% INPUT: dssd_divided
%
% OUTPUT: Outputs to "Data/" 
%
% USAGE: USAGE: variable 'subject_n' codes for subject id. It can be set 
% single (subject_n=1), multiple ( subject_n = 1:5 ), or all 
% subjects ( subject_n = 1:19)
% 
% 'cond_n' codes for conditions to process, and can be selected
% similiarly. 1 = "Correct Rejection", 2 = "False Alarm", 3 = "Hit", and
% 4 = "Miss"
%
% Created by: Mehdi Senoussi
% Modified by: Jonathan Giordano
% Date May 26th, 2019



conds = {'cr', 'fa', 'hit', 'miss'}; %lists possible conditions in data files names

home = pwd;

%For PC
data_dir = strcat(home, '\Data\dssd_divided\');
output_dir = strcat(home, '\Data\early_event_removed');

%For Max
%data_dir = strcat(home, + '/Data/dssd_dividied/');
%output_dir = strcat(home, '/Data/early_event_removed');


n_trials_per_subj = []; %Denotes number of trials per subject
problem_trials = []; %Denotes number of trials with the 'S 7X' trigger

n_subjects = 19;

for subject_n = 1:n_subjects
    
    if (subject_n == 12 ) || (subject_n == 17) %Skip missing subjects 12, 17
        continue
    end
    
    subj_data_dir = data_dir; %Concatenante data directory with file name
    
    % Original
    %subj_data_dir = [data_dir, num2str(subject_n), '/']; %Concatenante data directory with file name
    
    fprintf(sprintf('\n\nsubject %i\n', subject_n)) %Print out subject name
    for cond_n = 1:4
        cond_type = char(conds{cond_n}); %Select condition type
        
        subj_num = sprintf('%02i', subject_n); %Print out and set subject number
        
        EEG = pop_loadset('filename', [subj_num, sprintf('%s.set',... %Load EEG data 
                        cond_type)], 'filepath', subj_data_dir);
         
        % Original - I think this is when subject files are in different folders 
        %EEG = pop_loadset('filename', [subj_num, sprintf('%s.set',...
        %
        %               cond_type)], 'filepath', subj_data_dir);
    
        fprintf(sprintf('\n\tcondition %s\n', cond_type)) %Print out condition
        
        length_trials = []; %Create array with length of trials
        for i = 1:EEG.trials
            length_trials(i) = length(EEG.epoch(i).eventtype); %Find out how many events there are per epoch
            event_code = cell2mat(EEG.epoch(i).eventtype(1)); %Find value of first event
            problem_trials(subject_n, cond_n, i) = str2num(event_code(3:end)) > 30; %Check after the 'S', if it's greate than 30 it's a problem trigger
        end
        
        
        fprintf(sprintf('\t\tsubject %i - length_probs: %i, probs: %i - perc: %.2f\n',...
             subject_n, sum(length_trials>2), sum(problem_trials(subject_n, cond_n, :)),... %Print out number of trials with more than 2 events, print out number of problem trials
             sum(problem_trials(subject_n, cond_n, :)) / EEG.trials)) %Sum up and print out all problem trials (by %) by subject
        n_trials_per_subj(subject_n, cond_n) = EEG.trials; %Find number of trials per condition, per subject
        n_problems_per_subj(subject_n, cond_n) = sum(problem_trials(subject_n, cond_n, :)); %Calculate sum of problem trials per condition, per subject
        
        
        if cond_n == 4
            fprintf(sprintf('\n\t Total Percentage \n')) %Print out total
            fprintf(sprintf('\t\t subject %i - total_perc: %.2f\n', ...
                subject_n, sum(n_problems_per_subj(subject_n,:)/sum(n_trials_per_subj(subject_n, :)))))
        
        end
        
        trials_torej = squeeze(problem_trials(subject_n, cond_n, 1:EEG.trials)); %Squeeze results into array of trials to reject
        EEGclean = pop_rejepoch(EEG, trials_torej, 0); %Remove unwanted epochs according to trials_torej
        epochEEGfiltclean = pop_saveset(EEGclean, 'filename', ... %Save new files
            [subj_num, sprintf('%s.set',cond_type)],... 
            'filepath', output_dir); 
        
        
    end
end






