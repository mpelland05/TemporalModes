files_in.path = 'F:\MyStudies\TemporalModes\Scale_50_noLB\';
files_in.grouping.participants = {'AlCh' 'AnBe' 'BeMe' 'DiCe' 'FrCo' 'LL' 'MaDu' 'MaLa' 'MoBe' 'NaTe' 'SePo'...
				'SoSa' 'YP' 'YvLa' 'ChJa' 'CJ' 'ClDe' 'GeAl' 'JeRe' 'JM' 'JoFr' 'KaFo' 'LALH'...
				 'MaSa' 'NiLe' 'NiMi' 'OL' 'PG' 'SG' 'TJ'};
files_in.grouping.groups = {'CBx' 'SCx'};
files_in.grouping.tasks = {'rest' 'task'};

files_out = 'F:\MyStudies\TemporalModes\Concatenatedtseries50\RestTask_No_LB.mat';

ConcatenateTseries(files_in,files_out);