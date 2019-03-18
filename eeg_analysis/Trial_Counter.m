% SUMMARY: This script determines each subjects completed trials, and their
% percentage of trials in each category.
% 
% INPUT: dssd_divided
%
% OUTPUT: The results are recorded in an '.xlsx' file under "Results/".
% There are three seperate outputs files corresponding to: counts,
% percentages, and grand averages for all trials and subjects.
%
% USAGE: variable 'k' codes for subject id. It can be set single (k=1),
% multiple ( k = 1:5 ), or all subjects ( k = 1:19)
% 
% 'n' codes for conditions to process, and can be selected similiarly.
% n=1 "Correct Rejection", n=2 "False Alarm", n=3 "Hit", and n=4 "Miss"
%
% Made by: Jonathan Giordano
% January 28, 2019
%
%

%Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
count = [0, 0, 0,0]; %Trials counts
doc = " ";
home = pwd;

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it
for k=1:19
    
    %Skip missing subjects 12, 17
    if (k == 12 ) || (k == 17)
        continue
    end
    
    %Loop through each of the 4 conditions CR, FA, Hit, Miss
    for n=1:4
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, filename is of form '01cr.set'
        title = sprintf('ERP Data - Subject %02d - %s',k,condition(n)); %Create Title for plots
        
        % WINDOWS
        EEG = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
                
        % MAC
%       EEG = pop_loadset('filename',doc,'filepath',strcat(home, '/data/dssd_divided'));

        count(k,n) = EEG.trials;
     
    end
    
       
end

%Name Counts
Correct_Rejection = count(:,1);
False_Alarm = count(:,2);
Hit = count(:,3);
Miss = count(:,4);
Total = sum(count, 2);

%Build Table with count values
Table_Count = table(Correct_Rejection, False_Alarm, Hit, Miss, Total);

%Initiate Percentage Arrays
Perc_Correct_Rejection = zeros(length(Total),1);
Perc_False_Alarm = zeros(length(Total),1);
Perc_Hit = zeros(length(Total),1);
Perc_Miss = zeros(length(Total),1);
Perc_Correct = zeros(length(Total),1);
Perc_Wrong = zeros(length(Total),1);

%Calculate percentages
for n = 1:length(Total)
    
    %Skip missing subjects 12, 17
    if (n == 12 ) || (n == 17)
        Total(n) = 1; %This gets rid of result of NaN, and returns expected 0 | Can't divide by 0
    end
    
    Perc_Correct_Rejection(n,1) = 100*(Correct_Rejection(n)/Total(n));
    Perc_False_Alarm(n,1) = 100*(False_Alarm(n)/Total(n));
    Perc_Hit(n,1) = 100*(Hit(n)/Total(n));
    Perc_Miss(n,1) = 100*(Miss(n)/Total(n));
    Perc_Correct(n,1) = 100*((Correct_Rejection(n)+Hit(n))/Total(n));
    Perc_Wrong(n,1) = 100*((False_Alarm(n)+Miss(n))/Total(n));
end

Table_Percentage = table(Perc_Correct_Rejection, Perc_False_Alarm, Perc_Hit, Perc_Miss, Perc_Correct, Perc_Wrong);

%Calculate Grand Average

Perc_Grand_CR = (sum(Perc_Correct_Rejection)/(length(Total)-2)); %Subject 2 due to missing subjects 12, 17
Perc_Grand_FA = (sum(Perc_False_Alarm)/(length(Total)-2));
Perc_Grand_Hit = (sum(Perc_Hit)/(length(Total)-2));
Perc_Grand_Miss = (sum(Perc_Miss)/(length(Total)-2));
Perc_Grand_Correct = (sum(Perc_Correct)/(length(Total)-2));
Perc_Grand_False = (sum(Perc_Wrong)/(length(Total)-2));

Table_Grand_Avg = table(Perc_Grand_CR, Perc_Grand_FA, Perc_Grand_Hit, Perc_Grand_Miss, Perc_Grand_Correct, Perc_Grand_False);

%Export to Excel

excel_name = "Results/Trial_Counts.xlsx";
writetable(Table_Count,excel_name);

excel_name = "Results/Trials_Percentages.xlsx";
writetable(Table_Percentage,excel_name);

excel_name = "Results/Trials_Grand_Averages.xlsx";
writetable(Table_Grand_Avg,excel_name);