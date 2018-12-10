filenames = {
'S01_ds000117_EEG' ...
'S02_ds000117_EEG' ...
'S03_ds000117_EEG' ...
'S04_ds000117_EEG' ...
'S05_ds000117_EEG' ...
'S06_ds000117_EEG' ...
'S07_ds000117_EEG' ...
'S08_ds000117_EEG' ...
'S09_ds000117_EEG' ...
'S10_ds000117_EEG' ...

};
eeg_filenames = file_list_restrict(filenames,'EEG'); % only EEG files
meg_filenames = file_list_restrict(filenames,'MEG'); % only MEG files
% event code specifications for factor stimulus type
famous_faces = [5 6 7]; % specifies event codes of all famous faces
nonfamous_faces = [13 14 15]; % specifies event codes of all non-famous faces
scrambled_faces = [17 18 19]; % specifies event codes of all scrambled faces
% event code specifications for factor stimulus repetition
first_presentation = [5 13 17]; % specifies event codes of all first presentations
immediate_repeat = [6 14 18]; %   event codes of all immediate repeats
delayed_repeat = [7 15 19]; % specifies event codes of all delayed repeats
% GENERAL ANALYSIS CONFIGURATION SETTINGS
cfg = []; % clear the config variable
cfg.datadir = 'C:\MY_EXP\DATA'; % this is where the data files are
cfg.model = 'BDM'; % backward decoding ('BDM') or forward encoding ('FEM')
cfg.raw_or_tfr = 'raw'; % classify raw or time frequency representations ('tfr')
cfg.nfolds = 5; % the number of folds to use
cfg.class_method = 'AUC'; % the performance measure to use
cfg.crossclass = 'yes'; % whether to compute temporal generalization
cfg.channelpool = 'ALL_NOSELECTION'; % the channel selection to use
cfg.resample = 55; % downsample (useful for temporal generalization)
cfg.erp_baseline = [-.1,0]; % baseline correction in sec. ('no' for no correction)
% SPECIFIC SETTINGS: EEG NONFAMOUS VERSUS SCRAMBLED FACES
cfg.filenames = eeg_filenames; % data filenames (EEG in this case)
cfg.class_spec{1} = cond_string(nonfamous_faces,first_presentation); % the first stimulus class
cfg.class_spec{2} = cond_string(scrambled_faces,first_presentation); % the second stimulus class
cfg.outputdir = 'C:\MY_EXP\RESULTS\EEG_RAW\EEG_NONFAM_VS_SCRAMBLED'; % output location
adam_MVPA_firstlevel(cfg); % run first level analysis