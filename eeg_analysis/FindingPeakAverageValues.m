%This script produces the average value of an ERP over a given time
%interval
%
%Made by: Jonathan Giordano
%November 12, 2018
%
%

%% Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";

%% Create Variables for Averaging
chan = (47); %Select a channel to measure with this variable
start_time = 50; %Select interval start time
end_time = 150; %Select interval end tile
interval = round(0.5*start_time+101):round(0.5*end_time+101); %Time Interval, based on sampling of 500Hz
interval_avg = zeros(19,2); %Creates array of zeros for storing averages

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it

%% Comptuing averages

for k=1:19
    
    %Skip missing subjects 12, 17
    if (k == 12 ) || (k == 17)
        continue
    end
    
    %Loop through each of the 4 conditions CR, FA, Hit, Miss
    for n=1:4
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, create filename is of form '01cr.set'
        
        title = sprintf('ERP Data - Subject %02d - %s',k,condition(n)); %Create Title for plots
        % For PC
        % EEG = pop_loadset('filename',doc,'filepath','C:\\Users\\jonny\\Desktop\\Stage\\dssd_divided\\');
        
        % For Mac
        EEG = pop_loadset('filename',doc,'filepath','/Volumes/JVG_USB/Stage/dssd_divided/');
        
        EEG = eeg_checkset( EEG );
        
        %Calculate Average
        selec_data = (EEG.data(chan,interval,:)); %Selects specific channel at chosen interval
        test_avg = mean(selec_data, 3); %Averages data across trials
        interval_avg(k,n) = mean(test_avg);
        
    end
end

%% Exporting data

% Set variable type and size for table
var_types = {'double','double','double','double'}; 
sZ = [19 4];

%Build Table
T = table('Size',sZ,'VariableTypes',var_types,'VariableNames',{'Correct_Rejection','False_Alarm','Hit','Miss'});
T = table(interval_avg(:,1),interval_avg(:,2),interval_avg(:,3),interval_avg(:,4));

%Export
excel_name = "Avg Peak Value_"+string(start_time)+'-'+string(end_time)+'_'+string(47)+'.xlsx';
writetable(T,excel_name);
    
