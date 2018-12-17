%This script takes all .set files and converts them to Forward-Backward.
%
%In this way all saccades are "to the right" according to the scalp map,
%and all target displacements becomes forward, backward, or do not move
%in relation to the origin.
%
%This script produces Spectra plots for all conditions and subjects
%Setting 'k' below will allows one to select a certain subject
%corresponding to that number, or a certain range of subjects ie k =1:5
%will give ERP averages for all conditions of subjectts 1, 2, 3, 4, 5.
%
%Setting 'n' will do likewire but for conditions. With n=1 "Correct
%Rejection", n=2 "False Alarm", n=3 "Hit", and n=4 "Miss"%
%
%Made by: Jonathan Giordano
%December 10, 2018
%

%Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";
home = pwd;

EEG.etc.eeglabvers = '14.1.2'; % this tracks which version of EEGLAB is being used, you may ignore it
for k=1:19
    
    %Skip missing subjects 12, 17
    if (k == 12 ) || (k == 17)
        continue
    end
    
    %Loop through each of the 4 conditions CR, FA, Hit, Miss
    %CR = 1, FA = 2, Hit = 3, Miss = 4
    for n=1:4
        doc = sprintf('%02d%s.set',k,con(n)); %sprintf must be used for newer Matlab versions, filename is of form '01cr.set'
                
        % WINDOWS
        tEEG = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
                
        % MAC
        % tEEG = pop_loadset('filename',doc,'filepath',strcat(home, '/data/dssd_divided'));

        %Flip the data
        tEEG = Convert_To_FB(tEEG);
        
        %Convert to .SET file and Save
        title = sprintf('%02d%s',k,con(n)); %Create filename
        
        %WINDOWS
        EEG = pop_saveset(tEEG, title, strcat(home, '\data\flipped_files'));
        
        %MAC
        %EEG = pop_saveset(tEEG, title, strcat(home, '/data/flipped_files'));

        
    end
            
           
end

