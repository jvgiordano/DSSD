%This script takes all sorted epoch data from dssd_divided, and merges it
%into a complete matrix in EEG.data. Specifically, trials are
%concatenanted.
%The array "labels" indexes each of the conditions in this concatenanted
%matrix as such: CR = 1, FA = 2, Hit = 3, Miss = 4
%Finally, the data is saved to a .mat for a single subject. This allows the
%data to be decoded using Medhi's script.
%
%Made by: Jonathan Giordano
%November 26, 2018
%

%Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";
home = pwd;

labels = []; %Create "labels" vector containing conditions,
nlabels = []; %Blank matrix for reinitializing
nEEG = EEG; %Creates blank EEG Struct for reinitializing

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
                
        % For PC
        tEEG = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
                
        % MAC
        % tEEG = pop_loadset('filename',doc,'filepath',strcat(home, '/data/dssd_divided'));
        
        
        %Flip the data
        tEEG = Convert_To_FB(tEEG);
        
        %Concatenate
        EEG.data = cat(3, EEG.data, tEEG.data); 
        
        %Create "labels" array, 
        x = size(tEEG.data);
        tlabels = n*ones([1,x(3)]); %Set condition by number, CR = 1, FA = 2, Hit = 3, Miss = 4
        labels = [labels tlabels];
        
    end
    
    %Pass over 'times', 'chanlocs' in EEG Struct which are always the same
    EEG.times = tEEG.times;
    EEG.chanlocs = tEEG.chanlocs;
        
    %Convert to .SET file and Save
    title = sprintf('%02d',k); %Create title for plots
    EEG.labels = labels;
    
    %WINDOWS
    EEG = pop_saveset(EEG, title, strcat(home, '\data\flipped_decodable_files'));
        
    %MAC
    %EEG = pop_saveset(EEG, title, strcat(home, '/data/flipped_decodable_files'));
    
    %Save Chosen Variables to .mat file
    %title = sprintf('Data\\DecodableFiles\\%02d',k); %Create title for plots
    %save(title, 'EEG', 'labels');
    
    %Reinitialize variables
    EEG = nEEG;
    labels = nlabels;
       
end

