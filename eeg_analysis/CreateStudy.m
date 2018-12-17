%This script creates a STUDY with the selected datasets
%
%Made by: Jonathan Giordano
%November 19, 2018
%
% 
% 


%First start EEGLAB
eeglab

%Load in files
[STUDY ALLEEG] = std_editset( STUDY, [], 'commands', { ...
	{ 'index' 1 'load' 'Data/FlippedFiles/01cr.set' 'subject' 'S01' 'condition' 'Correct Rejection' }, ...
	{ 'index' 2 'load' 'Data/FlippedFiles/01fa.set' 'subject' 'S01' 'condition' 'False Alarm' }, ...
	{ 'index' 3 'load' 'Data/FlippedFiles/01hit.set' 'subject' 'S01' 'condition' 'Hit' }, ...
    { 'index' 4 'load' 'Data/FlippedFiles/01miss.set' 'subject' 'S01' 'condition' 'Miss' }, ...
    
    %{
    { 'index' 5 'load' 'Data/FlippedFiles/02cr.set' 'subject' 'S02' 'condition' 'Correct Rejection' }, ...
	{ 'index' 6 'load' 'Data/FlippedFiles/02fa.set' 'subject' 'S02' 'condition' 'False Alarm' }, ...
	{ 'index' 7 'load' 'Data/FlippedFiles/02hit.set' 'subject' 'S02' 'condition' 'Hit' }, ...
    { 'index' 8 'load' 'Data/FlippedFiles/02miss.set' 'subject' 'S02' 'condition' 'Miss' }, ...
    { 'index' 9 'load' 'Data/FlippedFiles/03cr.set' 'subject' 'S03' 'condition' 'Correct Rejection' }, ...
	{ 'index' 10 'load' 'Data/FlippedFiles/03fa.set' 'subject' 'S03' 'condition' 'False Alarm' }, ...
	{ 'index' 11 'load' 'Data/FlippedFiles/03hit.set' 'subject' 'S03' 'condition' 'Hit' }, ...
    { 'index' 12 'load' 'Data/FlippedFiles/03miss.set' 'subject' 'S03' 'condition' 'Miss' }, ...
    { 'index' 13 'load' 'Data/FlippedFiles/04cr.set' 'subject' 'S04' 'condition' 'Correct Rejection' }, ...
	{ 'index' 14 'load' 'Data/FlippedFiles/04fa.set' 'subject' 'S04' 'condition' 'False Alarm' }, ...
	{ 'index' 15 'load' 'Data/FlippedFiles/04hit.set' 'subject' 'S04' 'condition' 'Hit' }, ...
    { 'index' 16 'load' 'Data/FlippedFiles/04miss.set' 'subject' 'S04' 'condition' 'Miss' }, ...
    { 'index' 17 'load' 'Data/FlippedFiles/05cr.set' 'subject' 'S05' 'condition' 'Correct Rejection' }, ...
	{ 'index' 18 'load' 'Data/FlippedFiles/05fa.set' 'subject' 'S05' 'condition' 'False Alarm' }, ...
	{ 'index' 19 'load' 'Data/FlippedFiles/05hit.set' 'subject' 'S05' 'condition' 'Hit' }, ...
    { 'index' 20 'load' 'Data/FlippedFiles/05miss.set' 'subject' 'S05' 'condition' 'Miss' }, ...
    { 'index' 21 'load' 'Data/FlippedFiles/06cr.set' 'subject' 'S06' 'condition' 'Correct Rejection' }, ...
	{ 'index' 22 'load' 'Data/FlippedFiles/06fa.set' 'subject' 'S06' 'condition' 'False Alarm' }, ...
	{ 'index' 23 'load' 'Data/FlippedFiles/06hit.set' 'subject' 'S06' 'condition' 'Hit' }, ...
    { 'index' 24 'load' 'Data/FlippedFiles/06miss.set' 'subject' 'S06' 'condition' 'Miss' }, ...
    { 'index' 25 'load' 'Data/FlippedFiles/07cr.set' 'subject' 'S07' 'condition' 'Correct Rejection' }, ...
	{ 'index' 26 'load' 'Data/FlippedFiles/07fa.set' 'subject' 'S07' 'condition' 'False Alarm' }, ...
	{ 'index' 27 'load' 'Data/FlippedFiles/07hit.set' 'subject' 'S07' 'condition' 'Hit' }, ...
    { 'index' 28 'load' 'Data/FlippedFiles/07miss.set' 'subject' 'S07' 'condition' 'Miss' }, ...
    { 'index' 29 'load' 'Data/FlippedFiles/08cr.set' 'subject' 'S08' 'condition' 'Correct Rejection' }, ...
	{ 'index' 30 'load' 'Data/FlippedFiles/08fa.set' 'subject' 'S08' 'condition' 'False Alarm' }, ...
	{ 'index' 31 'load' 'Data/FlippedFiles/08hit.set' 'subject' 'S08' 'condition' 'Hit' }, ...
    { 'index' 32 'load' 'Data/FlippedFiles/08miss.set' 'subject' 'S08' 'condition' 'Miss' }, ...
    { 'index' 33 'load' 'Data/FlippedFiles/09cr.set' 'subject' 'S09' 'condition' 'Correct Rejection' }, ...
	{ 'index' 34 'load' 'Data/FlippedFiles/09fa.set' 'subject' 'S09' 'condition' 'False Alarm' }, ...
	{ 'index' 35 'load' 'Data/FlippedFiles/09hit.set' 'subject' 'S09' 'condition' 'Hit' }, ...
    { 'index' 36 'load' 'Data/FlippedFiles/09miss.set' 'subject' 'S09' 'condition' 'Miss' }, ...
    { 'index' 37 'load' 'Data/FlippedFiles/10cr.set' 'subject' 'S10' 'condition' 'Correct Rejection' }, ...
	{ 'index' 38 'load' 'Data/FlippedFiles/10fa.set' 'subject' 'S10' 'condition' 'False Alarm' }, ...
	{ 'index' 39 'load' 'Data/FlippedFiles/10hit.set' 'subject' 'S10' 'condition' 'Hit' }, ...
    { 'index' 40 'load' 'Data/FlippedFiles/10miss.set' 'subject' 'S10' 'condition' 'Miss' }, ...
    { 'index' 41 'load' 'Data/FlippedFiles/11cr.set' 'subject' 'S11' 'condition' 'Correct Rejection' }, ...
	{ 'index' 42 'load' 'Data/FlippedFiles/11fa.set' 'subject' 'S11' 'condition' 'False Alarm' }, ...
	{ 'index' 43 'load' 'Data/FlippedFiles/11hit.set' 'subject' 'S11' 'condition' 'Hit' }, ...
    { 'index' 44 'load' 'Data/FlippedFiles/11miss.set' 'subject' 'S11' 'condition' 'Miss' }, ...
    { 'index' 45 'load' 'Data/FlippedFiles/13cr.set' 'subject' 'S13' 'condition' 'Correct Rejection' }, ...
	{ 'index' 46 'load' 'Data/FlippedFiles/13fa.set' 'subject' 'S13' 'condition' 'False Alarm' }, ...
	{ 'index' 47 'load' 'Data/FlippedFiles/13hit.set' 'subject' 'S13' 'condition' 'Hit' }, ...
    { 'index' 48 'load' 'Data/FlippedFiles/13miss.set' 'subject' 'S13' 'condition' 'Miss' }, ...
    { 'index' 49 'load' 'Data/FlippedFiles/14cr.set' 'subject' 'S14' 'condition' 'Correct Rejection' }, ...
	{ 'index' 50 'load' 'Data/FlippedFiles/14fa.set' 'subject' 'S14' 'condition' 'False Alarm' }, ...
	{ 'index' 51 'load' 'Data/FlippedFiles/14hit.set' 'subject' 'S14' 'condition' 'Hit' }, ...
    { 'index' 52 'load' 'Data/FlippedFiles/14miss.set' 'subject' 'S14' 'condition' 'Miss' }, ...
    { 'index' 53 'load' 'Data/FlippedFiles/15cr.set' 'subject' 'S15' 'condition' 'Correct Rejection' }, ...
	{ 'index' 54 'load' 'Data/FlippedFiles/15fa.set' 'subject' 'S15' 'condition' 'False Alarm' }, ...
	{ 'index' 55 'load' 'Data/FlippedFiles/15hit.set' 'subject' 'S15' 'condition' 'Hit' }, ...
    { 'index' 56 'load' 'Data/FlippedFiles/15miss.set' 'subject' 'S15' 'condition' 'Miss' }, ...
    { 'index' 57 'load' 'Data/FlippedFiles/16cr.set' 'subject' 'S16' 'condition' 'Correct Rejection' }, ...
	{ 'index' 58 'load' 'Data/FlippedFiles/16fa.set' 'subject' 'S16' 'condition' 'False Alarm' }, ...
	{ 'index' 59 'load' 'Data/FlippedFiles/16hit.set' 'subject' 'S16' 'condition' 'Hit' }, ...
    { 'index' 60 'load' 'Data/FlippedFiles/16miss.set' 'subject' 'S16' 'condition' 'Miss' }, ...
    { 'index' 61 'load' 'Data/FlippedFiles/18cr.set' 'subject' 'S18' 'condition' 'Correct Rejection' }, ...
	{ 'index' 62 'load' 'Data/FlippedFiles/18fa.set' 'subject' 'S18' 'condition' 'False Alarm' }, ...
	{ 'index' 63 'load' 'Data/FlippedFiles/18hit.set' 'subject' 'S18' 'condition' 'Hit' }, ...
    { 'index' 64 'load' 'Data/FlippedFiles/18miss.set' 'subject' 'S18' 'condition' 'Miss' }, ...
    { 'index' 65 'load' 'Data/FlippedFiles/19cr.set' 'subject' 'S19' 'condition' 'Correct Rejection' }, ...
	{ 'index' 66 'load' 'Data/FlippedFiles/19fa.set' 'subject' 'S19' 'condition' 'False Alarm' }, ...
	{ 'index' 67 'load' 'Data/FlippedFiles/19hit.set' 'subject' 'S19' 'condition' 'Hit' }, ...
    { 'index' 68 'load' 'Data/FlippedFiles/19miss.set' 'subject' 'S19' 'condition' 'Miss' } 
    %}
    });

%This will pop up a window from which you can save the STUDY
STUDY = pop_savestudy( STUDY, EEG );
