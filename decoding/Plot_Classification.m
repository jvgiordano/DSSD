% SUMMARY: This script is to plot subject results, statistics,
% averagaed plot, topographic map, and temporal generalization
%
% INPUT: Requires appropriate data from /Results Folder
%
% OUTPUT: Individual and Group Plots, Temporal Generalization, and Scalp
% Maps
%
% USAGE:
%
% Made by: Jonathan Giordano
% May 22, 2019

%% Compute Statistics, plot all single subject results 


cfg = [];

cfg.startdir = 'C:\Users\jonny\Desktop\DSSD\Results\';
cfg.mpcompcor_method = 'cluster_based';
cfg.reduce_dims = 'diag'; %Train and test on the same time points
cfg.cluster_pval = 0.05; %Sets P-Value
cfg.channelpool = 'ALL_NOSELECTION'; %Selection of electrodes from first analysis
%cfg.splinefreq = 10; %Run a low pass filter at given frequency
%cfg.singleplot = true; %Plot single subject results

mvpa_stats = adam_compute_group_MVPA(cfg);

cfg.plot_order = { %'All_Conditions' ...
                   %'Correct_Response' ...
                   'Perceived_Movement' ...
                   'Stimulus_Movement' ...
                   };


adam_plot_MVPA(cfg, mvpa_stats);


%{
%%
%Set Configuration settings
figure(1)
title('Stimulus Movement AUC')
cfg = [];
cfg.startdir = strcat(pwd + "\Resuts\Flipped\Stimulus_Movement");
cfg.mpcompcor_method = 'cluster_based';
cfg.reduce_dims = 'diag'; %Train and test on the same points
%cfg.splinefreq = 11 %This is a low pass filter, remove it to see exact results
cfg.plotsubjects = true;

cfg.singleplot = true;
%Calculate statistics, plot single subjects
mvpa_stats = adam_compute_group_MVPA(cfg);
cfg.acclim = [0.4 .6];
adam_plot_MVPA(cfg, mvpa_stats);

%% Plot combined results
% Set Configuration Settings
cfg = [];
cfg.singleplot = true;
cfg.plotsubjects = true;
cfg.acclim = [0.4 .6];

%Plot combined results
adam_plot_MVPA(cfg, mvpa_stats);
title({'Stimulus Movement', 'Parietal Electrodes'})

%% Plot Topographic Maps

%Configuration Settings
cfg = [];
cfg.mpcompcor_method = 'cluster_based';
cfg.plotweights_or_pattern = 'covpatten';
cfg.weightlim = [-0.6 0.6];
cfg.timelim = [500 550];

%Plot Topo map
adam_plot_BDM_weights(cfg, mvpa_stats);

%% Plot Temporal Generalization


%Set Configuration Settings
cfg = [];
cfg.startdir = char(pwd + "\Resuts\Flipped\Stimulus_Movement_AUC");
cfg.mpcompcor_method = 'cluster_based';
cfg.iterations = 250;
mvpa_stats = adam_compute_group_MVPA(cfg);

%Plot Temporal Generalization

cfg = [];
adam_plot_MVPA(cfg, mvpa_stats);
%}