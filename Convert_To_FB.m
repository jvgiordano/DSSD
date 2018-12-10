function [outputArg] = Convert_To_FB(inputArg)
% Convert_to_FB - Returns EEG data in a Forward Back Scheme
%   Instead of the EEG data being split between saccaddes to the left and
%   right, Convert_to_FB takes all left saccades (events: S10, S11, S12)
%   and switches corresponding electrodes across the longitudinal fissure.
%
%   In this way all saccades are "to the right" according to the scalp map,
%   and all target displacements becomes forward, backward, or do not move
%   in relation to the origin.


%Filter out events that aren't epochs too ie S71,S72,S80,S81,S82

events = zeros(size(inputArg.data, 3));

n=1;
for i = 1:size(inputArg.event, 2)
    temp = inputArg.event(i).type; %Find Event Type
    temp2 = str2num(temp(3:end)); %Convert Event Type to Number 10,11,12
    if temp2 == 10 || temp2 ==11 || temp2 == 12 || temp2 == 20 || temp2 == 21 || temp2 == 22
        events(n) = temp2;
        n=n+1;
    end
end
    


% Cycle through all events, flip electrodes for cases of S10, S11, S12

for i = 1:n
    temp = events(i);
    if temp2 == 10 || temp2 ==11 || temp2 == 12
        inputArg.data([1 30],:,i) = inputArg.data([30 1],:,i);
    end
end

outputArg = inputArg;


end
