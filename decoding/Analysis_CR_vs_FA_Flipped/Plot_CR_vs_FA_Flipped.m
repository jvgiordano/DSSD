% SUMMARY: This script is to plot single subject results, statistics,
% averagaed plot, topographic map, and temporal generalization
%
% INPUT: Requires appropriate data from /Results Folder
%
% OUTPUT:
%
% USAGE:
%
% Made by: Jonathan Giordano
% April 4, 2019

%% Compute Statistics, plot all single subject results 

%Set Configuration settings
cfg = [];
cfg.startdir = char(pwd + "\Resuts\Flipped\CR_vs_FA_AUC");
cfg.mpcompcor_method = 'cluster_based';
cfg.reduce_dims = 'diag'; %Train and test on the same points
%cfg.splinefreq = 11 %This is a low pass filter, remove it to see exact results
cfg.plotsubjects = true;


%Calculate statistics, plot single subjects
figure(1)
mvpa_stats = adam_compute_group_MVPA(cfg);

%% Plot combined results

% Set Configuration Settings
cfg = [];
cfg.singleplot = true;
cfg.plotsubjects = true;
cfg.acclim = [0.40 .65];

%Plot combined results
adam_plot_MVPA(cfg, mvpa_stats);

%% Plot Topographic Maps

%Configuration Settings
cfg = [];
cfg.mpcompcor_method = 'cluster_based';
cfg.plotweights_or_pattern = 'covpattern';
cfg.weightlim = [-1.2 1.2];
cfg.timelim = [250 400];

%Plot Topo map
adam_plot_BDM_weights(cfg, mvpa_stats);

%% Plot Temporal Generalization


%Set Configuration Settings
cfg = [];
cfg.startdir = char(pwd + "\Resuts\Flipped\CR_vs_FA_AUC");
cfg.mpcompcor_method = 'cluster_based';
cfg.iterations = 250;
mvpa_stats = adam_compute_group_MVPA(cfg);

%Plot Temporal Generalization

cfg = [];
adam_plot_MVPA(cfg, mvpa_stats);
