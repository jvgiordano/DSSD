%This script produces the average value of an ERP over a given time for
%multiple electrodces
%
%
%Made by: Jonathan Giordano
%November 14, 2018
%
%

%% Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";

%% Create Variables for Averaging
chan = [3 5 35 37]; %Select channels to measure with this variable of form (X Y Z)
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
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, create filename of form '01cr.set'
        
        title = sprintf('ERP Data - Subject %02d - %s',k,condition(n)); %Create Title for plots
        % For PC
         EEG = pop_loadset('filename',doc,'filepath','C:\\Users\\jonny\\Desktop\\Stage\\dssd_divided\\');
        
        % For Mac
        % EEG = pop_loadset('filename',doc,'filepath','/Volumes/JVG_USB/Stage/dssd_divided/');
        
        EEG = eeg_checkset( EEG );
        
        %Calculate Average
        %EEG Data is of form Channel:Voltage:Trials
        selec_data = (EEG.data(chan,interval,:)); %Selects specific channel at chosen interval
        test_avg = mean(selec_data, 3); %Averages data across trials
        test_avg = mean(test_avg, 1); %Averages data across channels
        interval_avg(k,n) = mean(test_avg);
        
    end
end

%% Exporting data

%Name Averages
Correct_Rejection = interval_avg(:,1);
False_Alarm = interval_avg(:,2);
Hit = interval_avg(:,3);
Miss = interval_avg(:,4); 

%Build Table
T = table(Correct_Rejection, False_Alarm, Hit, Miss);

%Export
chan2 = sprintf('%.f-',chan);
chan2 = chan2(1:end-1);
excel_name = "Avg Peak Value_"+string(start_time)+'-'+string(end_time)+'_'+chan2+'.xlsx';
writetable(T,excel_name);
    
