%This script takes all sorted epoch data from dssd_divided, and merges it
%into a complete matrix in EEG.data. Specifically, trials are
%concatenanted.
%The array "labels" indexes each of the conditions in this concatenanted
%matrix as such: CR = 1, FA = 2, Hit = 3, Miss = 4
%Finally, the data is saved to a .mat for a single subject. This allows the
%data to be decoded.
%
%This script produces Spectra plots for all conditions and subjects
%Setting 'k' below will allows one to select a certain subject
%corresponding to that number, or a certain range of subjects ie k =1:5
%will give ERP averages for all conditions of subjectts 1, 2, 3, 4, 5.
%
%Setting 'n' will do likewire but for conditions. With n=1 "Correct
%Rejection", n=2 "False Alarm", n=3 "Hit", and n=4 "Miss"


%
%Made by: Jonathan Giordano
%November 26, 2018
%

%Create Condition Array
con = ["cr", "fa", "hit", "miss"];
condition = ["Correct Rejection", "False Alarm", "Hit", "Miss"];
doc = " ";
home = pwd;

%Create "labels" vector containing conditions,
labels = [];
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
                
        % WINDOWS
        tEEG = pop_loadset('filename',doc,'filepath', strcat(home, '\data\dssd_divided'));
                
        % MAC
        % tEEG = pop_loadset('filename',doc,'filepath',strcat(home, '/data/dssd_divided'));
        
        EEG.data = cat(3, EEG.data, tEEG.data); 
        
        %Create "labels" array, 
        x = size(tEEG.data);
        tlabels = n*ones([1,x(3)]); %Set condition by number, CR = 1, FA = 2, Hit = 3, Miss = 4
        labels = [labels tlabels];
        
    end
    
    %Pass over 'times', 'chanlocs' in EEG Struct which are always the same
    EEG.times = tEEG.times;
    EEG.chanlocs = tEEG.chanlocs;
    
    %Save Chosen Variables to .mat file
    %title = sprintf('DecodableFiles\\%02d',k); %Create title for plots
    %save(title, 'EEG', 'labels');
    
    %Convert to .SET file and Save
    title = sprintf('%02d',k); %Create title for plots
    EEG.labels = labels;   
    
    %WINDOWS
    EEG = pop_saveset(EEG, title, strcat(home, '\data\decodable_files'));
        
    %MAC
    %EEG = pop_saveset(EEG, title, strcat(home, '/data/decodable_files'));
    
    %Reinitialize variables
    EEG = nEEG;
    labels = nlabels;
       
end