% SUMMARY: This script will run decoding analysis on the data for the
% following conditions:
% 1. All conditions 
% 2. Correct Responses
% 3. Perceived Movement
% 4. Stimulus Movement
% 5. CR vs FA (Same Stimulus, Different Response)
% 6. CR vs Miss (Different Stimulus, Same Response)
% 7. Hit vs FA (Different Stimulus, Same Response)
% 8. Hit vs Miss (Same Stimulus, Different Response)
%
% INPUT: Input is set by the 'cfg.datadir' parameter. This will be
% a selection from the /Data folder
% 
% OUTPUT: Output is set by the 'cfg.outputdir' paramter. This should go to
% the /Results folder. The variable 'experiment' will give the user the
% option to choose the experiment name based on the analysis they are
% running.
%
% NOTE: This will run on MAC folder structure by default. To run on PC,
% comment out the MAC lines for 'cfg.outputdir' and 'cfg.datadir'
%
% By: Jonny Giordano
% Made: May 16th, 2019

% GENERAL ANALYSIS CONFIGURATION SETTINGS
home = pwd; %Home is setting to working directory
experiment = char(home + "/Results/Flipped/" + "Contra_Parietal"); %Adjust result's directory
cfg = []; % clear the config variable

%Loop through various analysis
for i = 1:8
    
    %In order to skip a case, uncomment the 'continue' for it
    
    if i == 1 %All Conditions
        class_1 = 1;
        class_2 = 2;
        class_3 = 3;
        class_4 = 4;
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\All_Conditions"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/All_Conditions"); % output location
        
        %continue;
    elseif i == 2 %Correct Response
        class_1 = [1,3];
        class_2 = [2,4];
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\Correct Reponse"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/CorrectReponse"); % output location        
        
        %contiue;
    elseif i == 3 %Perceived Movement
        class_1 = [2,3];
        class_2 = [1,4];
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\Perceived_Movement"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/Perceived_Movement"); % output location
        
        %continue
    elseif i == 4 %Stimulus Movement
        class_1 = [1,2];
        class_2 = [3,4];
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\Stimulus_Movement"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/Stimulus_Movement"); % output location        
        
        %continue
    elseif i == 5 %CR vs FA
        class_1 = 1;
        class_2 = 2;  
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\CR_vs_FA"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/CR_vs_FA"); % output location        
        
        %continue
    elseif i == 6 %CR vs Miss
        class_1 = 1;
        class_2 = 4;   
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\CR_vs_Miss"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/CR_vs_Miss"); % output location 
        
        %continue
    elseif i == 7 %Hit vs FA
        class_1 = 3;
        class_2 = 2; 
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\Hit_vs_FA"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/Hit_vs_FA"); % output location 
        
        %continue
    elseif i == 8 %Hit vs Miss
        class_1 = 3;
        class_2 = 4;
        
        %WINDOWS
        cfg.outputdir = char(experiment + "\Hit_vs_Miss"); % output location

        %MAC
        cfg.outputdir = char(experiment + "/Hit_vs_Miss"); % output location         
        
        %continue
    end
    
    filenames = {
    '01_all_flipped' ...
    '02_all_flipped' ...
    '03_all_flipped' ...
    '04_all_flipped' ...
    '05_all_flipped' ...
    '06_all_flipped' ...
    '07_all_flipped' ...
    '08_all_flipped' ... 
    '09_all_flipped' ...
    '10_all_flipped' ...
    '11_all_flipped' ...
    '13_all_flipped' ...
    '14_all_flipped' ...
    '15_all_flipped' ...
    '16_all_flipped' ...
    '18_all_flipped' ... 
    '19_all_flipped' ...
    };

    %eeg_filenames = file_list_restrict(filenames,'EEG'); % only EEG files
    %meg_filenames = file_list_restrict(filenames,'MEG'); % only MEG files

    %WINDOWS
    cfg.datadir = char(home + "\Data\recoded_files_flipped"); % this is where the data files are

    %MAC
    cfg.datadir = char(home + "/Data/recoded_files_flipped"); % this is where the data files are


    cfg.model = 'BDM'; % backward decoding ('BDM') or forward encoding ('FEM')
    cfg.raw_or_tfr = 'raw'; % classify raw or time frequency representations ('tfr')
    cfg.nfolds = 10; % the number of folds to use
    cfg.class_method = 'AUC'; % the performance measure to use, AUC is other option
    cfg.crossclass = 'yes'; % whether to compute temporal generalization
    cfg.channelpool = 'P7,P5,P3,P1,PO7,PO3'; % the channel selection to use
    cfg.resample = 150; % downsample (useful for temporal generalization)
    cfg.erp_baseline = 'no'; % baseline correction in sec. ('no' for no correction)
    %cfg.erp_baseline = [-0.2,0]; % baseline correction in sec. ('no' for no correction)
    

    % SPECIFIC SETTINGS: EEG NONFAMOUS VERSUS SCRAMBLED FACES
    cfg.filenames = filenames; % data filenames (EEG in this case)
    
    if i == 1 %Seperate All_Conditions Classification from other cases
        cfg.class_spec{1} = cond_string(class_1); % the first stimulus class
        cfg.class_spec{2} = cond_string(class_2); % the second stimulus class
        cfg.class_spec{3} = cond_string(class_3);
        cfg.class_spec{4} = cond_string(class_4);
    else
        cfg.class_spec{1} = cond_string(class_1); % the first stimulus class
        cfg.class_spec{2} = cond_string(class_2); % the second stimulus class
    end

    adam_MVPA_firstlevel(cfg); % run first level analysis

end