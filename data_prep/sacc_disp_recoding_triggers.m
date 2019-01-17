% Created by Mehdi Senoussi
%
%

% specify in which file to "re-code" the triggers
file_name = '01hit';

location = pwd;
location = location+"\data\dssd_divided";
EEG = pop_loadset([location, file_name, '.set']);
% how many events were there in that EEG dataset
n_event = length(EEG.event);
% loop across all events
for event_i = 1:n_event
    % get the trigger "label"/"type" and only keep the numerical part
    temp = str2num(EEG.event(event_i).type(3:end));
    % store the 
    EEG.event(event_i).type = temp;
    EEG.event(event_i).code = temp;
end

% same thing but with the triggers stored in the epoch field of the EEGlab
% structure
n_epoch = length(EEG.epoch);
for epoch_i = 1:n_epoch
    temp = {};
    for ev_n = 1:length(EEG.epoch(epoch_i).eventtype)
        a = char(EEG.epoch(epoch_i).eventtype(ev_n));
        temp{ev_n} = str2num(a(3:end));
    end
    EEG.epoch(epoch_i).eventtype = temp;
end

pop_saveset(EEG, 'filename', [file_name, '_numEvent.set'],...
    'filepath', './DATA/decodable_files_raw');