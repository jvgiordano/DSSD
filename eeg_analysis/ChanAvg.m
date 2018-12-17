function [outputArg] = ChanAvg(inputArg, selection)
% CHANAVG - Returns Averaged EEG Data of requested channels
%   
inputArg.data = inputArg.data(selection,:,:); %Select channels out of EEG data
input.data = mean(inputArg.data, 1); %Average across trials
outputArg = inputArg;
end

