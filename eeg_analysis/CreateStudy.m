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
	{ 'index' 1 'load' 'Data/dssd_divided/01cr.set' 'subject' 'S01' 'condition' 'Correct Rejection' }, ...
	{ 'index' 2 'load' 'Data/dssd_divided/01fa.set' 'subject' 'S01' 'condition' 'False Alarm' }, ...
	{ 'index' 3 'load' 'Data/dssd_divided/01hit.set' 'subject' 'S01' 'condition' 'Hit' }, ...
    { 'index' 4 'load' 'Data/dssd_divided/01miss.set' 'subject' 'S01' 'condition' 'Miss' }, ...
    { 'index' 5 'load' 'Data/dssd_divided/02cr.set' 'subject' 'S02' 'condition' 'Correct Rejection' }, ...
	{ 'index' 6 'load' 'Data/dssd_divided/02fa.set' 'subject' 'S02' 'condition' 'False Alarm' }, ...
	{ 'index' 7 'load' 'Data/dssd_divided/02hit.set' 'subject' 'S02' 'condition' 'Hit' }, ...
    { 'index' 8 'load' 'Data/dssd_divided/02miss.set' 'subject' 'S02' 'condition' 'Miss' }, ...
    { 'index' 9 'load' 'Data/dssd_divided/03cr.set' 'subject' 'S03' 'condition' 'Correct Rejection' }, ...
	{ 'index' 10 'load' 'Data/dssd_divided/03fa.set' 'subject' 'S03' 'condition' 'False Alarm' }, ...
	{ 'index' 11 'load' 'Data/dssd_divided/03hit.set' 'subject' 'S03' 'condition' 'Hit' }, ...
    { 'index' 12 'load' 'Data/dssd_divided/03miss.set' 'subject' 'S03' 'condition' 'Miss' }, ...
    { 'index' 13 'load' 'Data/dssd_divided/04cr.set' 'subject' 'S04' 'condition' 'Correct Rejection' }, ...
	{ 'index' 14 'load' 'Data/dssd_divided/04fa.set' 'subject' 'S04' 'condition' 'False Alarm' }, ...
	{ 'index' 15 'load' 'Data/dssd_divided/04hit.set' 'subject' 'S04' 'condition' 'Hit' }, ...
    { 'index' 16 'load' 'Data/dssd_divided/04miss.set' 'subject' 'S04' 'condition' 'Miss' }, ...
    { 'index' 17 'load' 'Data/dssd_divided/05cr.set' 'subject' 'S05' 'condition' 'Correct Rejection' }, ...
	{ 'index' 18 'load' 'Data/dssd_divided/05fa.set' 'subject' 'S05' 'condition' 'False Alarm' }, ...
	{ 'index' 19 'load' 'Data/dssd_divided/05hit.set' 'subject' 'S05' 'condition' 'Hit' }, ...
    { 'index' 20 'load' 'Data/dssd_divided/05miss.set' 'subject' 'S05' 'condition' 'Miss' }, ...
    { 'index' 21 'load' 'Data/dssd_divided/06cr.set' 'subject' 'S06' 'condition' 'Correct Rejection' }, ...
	{ 'index' 22 'load' 'Data/dssd_divided/06fa.set' 'subject' 'S06' 'condition' 'False Alarm' }, ...
	{ 'index' 23 'load' 'Data/dssd_divided/06hit.set' 'subject' 'S06' 'condition' 'Hit' }, ...
    { 'index' 24 'load' 'Data/dssd_divided/06miss.set' 'subject' 'S06' 'condition' 'Miss' }, ...
    { 'index' 25 'load' 'Data/dssd_divided/07cr.set' 'subject' 'S07' 'condition' 'Correct Rejection' }, ...
	{ 'index' 26 'load' 'Data/dssd_divided/07fa.set' 'subject' 'S07' 'condition' 'False Alarm' }, ...
	{ 'index' 27 'load' 'Data/dssd_divided/07hit.set' 'subject' 'S07' 'condition' 'Hit' }, ...
    { 'index' 28 'load' 'Data/dssd_divided/07miss.set' 'subject' 'S07' 'condition' 'Miss' }, ...
    { 'index' 29 'load' 'Data/dssd_divided/08cr.set' 'subject' 'S08' 'condition' 'Correct Rejection' }, ...
	{ 'index' 30 'load' 'Data/dssd_divided/08fa.set' 'subject' 'S08' 'condition' 'False Alarm' }, ...
	{ 'index' 31 'load' 'Data/dssd_divided/08hit.set' 'subject' 'S08' 'condition' 'Hit' }, ...
    { 'index' 32 'load' 'Data/dssd_divided/08miss.set' 'subject' 'S08' 'condition' 'Miss' }, ...
    { 'index' 33 'load' 'Data/dssd_divided/09cr.set' 'subject' 'S09' 'condition' 'Correct Rejection' }, ...
	{ 'index' 34 'load' 'Data/dssd_divided/09fa.set' 'subject' 'S09' 'condition' 'False Alarm' }, ...
	{ 'index' 35 'load' 'Data/dssd_divided/09hit.set' 'subject' 'S09' 'condition' 'Hit' }, ...
    { 'index' 36 'load' 'Data/dssd_divided/09miss.set' 'subject' 'S09' 'condition' 'Miss' }, ...
    { 'index' 37 'load' 'Data/dssd_divided/10cr.set' 'subject' 'S10' 'condition' 'Correct Rejection' }, ...
	{ 'index' 38 'load' 'Data/dssd_divided/10fa.set' 'subject' 'S10' 'condition' 'False Alarm' }, ...
	{ 'index' 39 'load' 'Data/dssd_divided/10hit.set' 'subject' 'S10' 'condition' 'Hit' }, ...
    { 'index' 40 'load' 'Data/dssd_divided/10miss.set' 'subject' 'S10' 'condition' 'Miss' }, ...
    { 'index' 41 'load' 'Data/dssd_divided/11cr.set' 'subject' 'S11' 'condition' 'Correct Rejection' }, ...
	{ 'index' 42 'load' 'Data/dssd_divided/11fa.set' 'subject' 'S11' 'condition' 'False Alarm' }, ...
	{ 'index' 43 'load' 'Data/dssd_divided/11hit.set' 'subject' 'S11' 'condition' 'Hit' }, ...
    { 'index' 44 'load' 'Data/dssd_divided/11miss.set' 'subject' 'S11' 'condition' 'Miss' }, ...
    { 'index' 45 'load' 'Data/dssd_divided/13cr.set' 'subject' 'S13' 'condition' 'Correct Rejection' }, ...
	{ 'index' 46 'load' 'Data/dssd_divided/13fa.set' 'subject' 'S13' 'condition' 'False Alarm' }, ...
	{ 'index' 47 'load' 'Data/dssd_divided/13hit.set' 'subject' 'S13' 'condition' 'Hit' }, ...
    { 'index' 48 'load' 'Data/dssd_divided/13miss.set' 'subject' 'S13' 'condition' 'Miss' }, ...
    { 'index' 49 'load' 'Data/dssd_divided/14cr.set' 'subject' 'S14' 'condition' 'Correct Rejection' }, ...
	{ 'index' 50 'load' 'Data/dssd_divided/14fa.set' 'subject' 'S14' 'condition' 'False Alarm' }, ...
	{ 'index' 51 'load' 'Data/dssd_divided/14hit.set' 'subject' 'S14' 'condition' 'Hit' }, ...
    { 'index' 52 'load' 'Data/dssd_divided/14miss.set' 'subject' 'S14' 'condition' 'Miss' }, ...
    { 'index' 53 'load' 'Data/dssd_divided/15cr.set' 'subject' 'S15' 'condition' 'Correct Rejection' }, ...
	{ 'index' 54 'load' 'Data/dssd_divided/15fa.set' 'subject' 'S15' 'condition' 'False Alarm' }, ...
	{ 'index' 55 'load' 'Data/dssd_divided/15hit.set' 'subject' 'S15' 'condition' 'Hit' }, ...
    { 'index' 56 'load' 'Data/dssd_divided/15miss.set' 'subject' 'S15' 'condition' 'Miss' }, ...
    { 'index' 57 'load' 'Data/dssd_divided/16cr.set' 'subject' 'S16' 'condition' 'Correct Rejection' }, ...
	{ 'index' 58 'load' 'Data/dssd_divided/16fa.set' 'subject' 'S16' 'condition' 'False Alarm' }, ...
	{ 'index' 59 'load' 'Data/dssd_divided/16hit.set' 'subject' 'S16' 'condition' 'Hit' }, ...
    { 'index' 60 'load' 'Data/dssd_divided/16miss.set' 'subject' 'S16' 'condition' 'Miss' }, ...
    { 'index' 61 'load' 'Data/dssd_divided/18cr.set' 'subject' 'S18' 'condition' 'Correct Rejection' }, ...
	{ 'index' 62 'load' 'Data/dssd_divided/18fa.set' 'subject' 'S18' 'condition' 'False Alarm' }, ...
	{ 'index' 63 'load' 'Data/dssd_divided/18hit.set' 'subject' 'S18' 'condition' 'Hit' }, ...
    { 'index' 64 'load' 'Data/dssd_divided/18miss.set' 'subject' 'S18' 'condition' 'Miss' }, ...
    { 'index' 65 'load' 'Data/dssd_divided/19cr.set' 'subject' 'S19' 'condition' 'Correct Rejection' }, ...
	{ 'index' 66 'load' 'Data/dssd_divided/19fa.set' 'subject' 'S19' 'condition' 'False Alarm' }, ...
	{ 'index' 67 'load' 'Data/dssd_divided/19hit.set' 'subject' 'S19' 'condition' 'Hit' }, ...
    { 'index' 68 'load' 'Data/dssd_divided/19miss.set' 'subject' 'S19' 'condition' 'Miss' } 
    %}
    });

%This will pop up a window from which you can save the STUDY
STUDY = pop_savestudy( STUDY, EEG );
