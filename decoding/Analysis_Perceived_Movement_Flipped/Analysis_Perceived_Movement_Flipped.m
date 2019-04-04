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

% event code specifications for factor stimulus type
% Following criteria are possible:
% Test all conditions -> [1], [2], [3], [4]
% Jump vs NoJump (CR and FA vs Hit and Miss) -> [1, 2] [3, 4]
% Correct vs Non-Correct (Hit and CR vs FA and Miss) -> [1, 3] [2, 4]
% Perceived Movement vs None (Hit and FA) vs (CR and Miss) -> [2,3] [1,4]
%
class_1 = [2, 3];
class_2 = [1, 4];

% GENERAL ANALYSIS CONFIGURATION SETTINGS
home = pwd; %Home is setting to working directory
cfg = []; % clear the config variable
cfg.datadir = char(home + "\Data\recoded_files_flipped"); % this is where the data files are
cfg.model = 'BDM'; % backward decoding ('BDM') or forward encoding ('FEM')
cfg.raw_or_tfr = 'raw'; % classify raw or time frequency representations ('tfr')
cfg.nfolds = 10; % the number of folds to use
cfg.class_method = 'AUC'; % the performance measure to use, AUC is other option
cfg.crossclass = 'yes'; % whether to compute temporal generalization
cfg.channelpool = 'ALL_NOSELECTION'; % the channel selection to use
cfg.resample = 150; % downsample (useful for temporal generalization)
cfg.erp_baseline = [-.1,0]; % baseline correction in sec. ('no' for no correction)


% SPECIFIC SETTINGS: EEG NONFAMOUS VERSUS SCRAMBLED FACES
cfg.filenames = filenames; % data filenames (EEG in this case)
cfg.class_spec{1} = cond_string(class_1); % the first stimulus class
cfg.class_spec{2} = cond_string(class_2); % the second stimulus class
cfg.outputdir = char(home+ "\Results\Flipped\Correct_Response_AUC"); % output location
adam_MVPA_firstlevel(cfg); % run first level analysis

%% Plot

% load([cfg.outputdir, '/ALL_NOSELECTION/CLASS_PERF_02_all_flipped_10fold.mat']); %Load in file to plot
% 
% n_classes = length(settings.condset);
% n_timep = length(settings.times{1});
% figure; hold on
% plot(settings.times{1},...
%     BDM.ClassOverTime(logical(eye(size(BDM.ClassOverTime, 1)))))
% plot([settings.times{1}(1), settings.times{1}(end)],...
%     [1./n_classes, 1./n_classes], 'k--');
% xlabel('Time course from stimulus onset (s)');
% ylabel('Classification accuracy');
% title('Jump vs No Jump (CR and FA vs Hit and Miss) \n Subject 02')
% grid on;
% legend({'Classification accuracy', 'Chance level'}, 'FontSize', 12)