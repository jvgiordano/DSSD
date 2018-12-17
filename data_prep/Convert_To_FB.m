function [outputArg] = Convert_To_FB(inputArg)
% Convert_to_FB - Returns EEG data in a Forward Back Scheme
%   Instead of the EEG data being split between saccaddes to the left and
%   right, Convert_to_FB takes all left saccades (events: S10, S11, S12)
%   and switches corresponding electrodes across the longitudinal fissure.
%
%   In this way all saccades are "to the right" according to the scalp map,
%   and all target displacements becomes forward, backward, or do not move
%   in relation to the origin.
%
%
% Made by: Jonathan Giordano
% December 9, 2018
%
%


%Filter out events that aren't epochs markers, ie S71,S72,S80,S81,S82

events = zeros(size(inputArg.data, 3)); %Store actual events in array for number of epochs

n=1;
for i = 1:size(inputArg.event, 2)
    temp = inputArg.event(i).type; %Find Event Type
    temp2 = str2num(temp(3:end)); %Convert Event Type to Number 10,11,12, etc.
    if temp2 == 10 || temp2 ==11 || temp2 == 12 || temp2 == 20 || temp2 == 21 || temp2 == 22
        events(n) = temp2;
        n=n+1;
    end
end


% Cycle through all events, flip electrodes for cases of S10, S11, S12
% Electrodes 2, 12, 16, 23, 33, 38, 47, 52 remain unchanged
for i = 1:n
    temp2 = events(i);
    if temp2 == 10 || temp2 == 11 || temp2 == 12
        inputArg.data([1 30],:,i) = inputArg.data([30 1],:,i);  %Swap electrodes 1, 30
        inputArg.data([3 28],:,i) = inputArg.data([28 3],:,i);  %Swap electrodes 3, 28
        inputArg.data([4 29],:,i) = inputArg.data([29 4],:,i);  %Swap electrodes 4, 29, etc.
        inputArg.data([5 26],:,i) = inputArg.data([26 5],:,i);
        inputArg.data([6 27],:,i) = inputArg.data([27 6],:,i);
        inputArg.data([7 24],:,i) = inputArg.data([24 7],:,i);
        inputArg.data([8 25],:,i) = inputArg.data([25 8],:,i);
        inputArg.data([9 20],:,i) = inputArg.data([20 9],:,i);
        inputArg.data([10 21],:,i) = inputArg.data([21 10],:,i);
        inputArg.data([11 22],:,i) = inputArg.data([22 11],:,i);
        inputArg.data([13 18],:,i) = inputArg.data([18 12],:,i);
        inputArg.data([14 19],:,i) = inputArg.data([19 14],:,i);
        inputArg.data([15 17],:,i) = inputArg.data([15 17],:,i);
        inputArg.data([31 62],:,i) = inputArg.data([62 31],:,i);
        inputArg.data([32 61],:,i) = inputArg.data([61 32],:,i);
        inputArg.data([34 60],:,i) = inputArg.data([60 34],:,i);
        inputArg.data([35 59],:,i) = inputArg.data([59 35],:,i);
        inputArg.data([36 58],:,i) = inputArg.data([58 36],:,i);
        inputArg.data([37 57],:,i) = inputArg.data([57 37],:,i);
        inputArg.data([39 56],:,i) = inputArg.data([56 39],:,i);
        inputArg.data([40 55],:,i) = inputArg.data([55 40],:,i);
        inputArg.data([41 54],:,i) = inputArg.data([54 41],:,i);
        inputArg.data([42 53],:,i) = inputArg.data([53 42],:,i);
        inputArg.data([43 51],:,i) = inputArg.data([51 43],:,i);
        inputArg.data([44 50],:,i) = inputArg.data([50 44],:,i);
        inputArg.data([45 49],:,i) = inputArg.data([49 45],:,i);
        inputArg.data([16 48],:,i) = inputArg.data([48 16],:,i);
    end
end

outputArg = inputArg;


end
