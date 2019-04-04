% SUMMARY: This script is to run all possible analysis for flipped data.
%
% INPUT: Requires appropriate data scripts to be located in
% scripts/decoding folders, and the appropriate data in /data
%
% OUTPUT:
%
% USAGE:
%
% Made by: Jonathan Giordano
% April 4, 2019

%% All Conditions
run Analysis_Test_All_Conditions.m


%% Combined conditions
run Analysis_Correct_Response_Flipped.m
run Analysis_Perceived_Movement_Flipped.m
run Analysis_Stimulus_Movement_Flipped

%% Individal conditions
run Analysis_CR_vs_FA_Flipped.m
run Analysis_CR_vs_Miss_Flipped.m
run Analysis_Hit_vs_FA_Flipped.m
run Analysis_Hit_vs_Miss_Flipped.m


