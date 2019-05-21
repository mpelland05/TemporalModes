files_in.path = '/home/mpelland/database/blindtvr/fmri/fmri_preprocess_01_wBeMe/';
files_in.groups = {'CBxxx' 'SCxxx'};
files_in.run = {'task'};
files_in.mask = '/home/mpelland/database/blindtvr/fmri/basc_02_noLB/stability_group/sci100_scg100_scf100/brain_partition_consensus_group_sci100_scg100_scf100.mnc.gz';
files_in.scale = 100;
files_out = '/home/mpelland/database/blindVariability/fmri/AveragedTseries_noLB/';

ExtractTseries4WindowAnalysis(files_in,files_out);


files_in.path = '/home/mpelland/database/blindtvr/fmri/fmri_preprocess_01_wBeMe/';
files_in.groups = {'CBxxx' 'SCxxx'};
files_in.run = {'task'};
files_in.mask = '/home/mpelland/database/blindtvr/fmri/basc_02_noLB/stability_group/sci50_scg50_scf50/brain_partition_consensus_group_sci50_scg50_scf50.mnc.gz';
files_in.scale = 50;
files_out = '/home/mpelland/database/blindVariability/fmri/AveragedTseries_noLB/';

ExtractTseries4WindowAnalysis(files_in,files_out);