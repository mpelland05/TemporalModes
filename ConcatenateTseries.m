function ConcatenateTseries(files_in,files_out)
%This function will take all files within a folder and concatenate them
%this is done only on selected voxels if a mask is provided. 
%Name of participants and string about the task must be included to get
%indices that will allow to differentiate whose timepoints are whose
%
%files_in
%	.path		string, full path to the folder containing the volumes
%			files must be bidimensional as extracted by the script
%			ExtractTseries4WindowAnalysis
%	.grouping	structure containing cells of strings, will be used
%			to make a matrix containing information to partition
%			the time series on subsequent 
%	.mask		string, full path to the mask to be used (0's are avoided
%				any other value is taken in). Same format as the
%				the files_in, otherwise won't work.
%			----> this function is not complete
%
%files_out =		string, full path to folder that will contain the results and n
%			name of file that it will be in. must finish with .mat
%
%
%%%Example input
%files_in.path = 'F:\TemporalModes\Scale_50\';
%files_in.grouping.participants = {'AlCh' 'AnBe' 'BeMe' 'DiCe' 'FrCo' 'LL' 'MaDu' 'MaLa' 'MoBe' 'NaTe' 'SePo'...
%				'SoSa' 'YP' 'YvLa' 'ChJa' 'CJ' 'ClDe' 'GeAl' 'JeRe' 'JM' 'JoFr' 'KaFo' 'LALH'...
%				 'MaSa' 'NiLe' 'NiMi' 'OL' 'PG' 'SG' 'TJ'};
%files_in.grouping.groups = {'CBx' 'SCx'};
%files_in.grouping.tasks = {'rest' 'task'};
%
%
%%% Output
% Structure with concatenation, matrix containing grouping information and voxel indexes

%%%%%%%%
%find list of files names using  files_in.path
%%%%%%%%
tdir = dir(files_in.path);
tnam = find(vertcat(tdir.isdir) == 0);

for tt = 1:length(tnam),
    tpnames{tt} = tdir(tnam(tt)).name;
end

%%%%% option for normalizaing tseries
opt.type = 'mean_var';

%%%%%%%
% big loop of concatenation
%%%%%%%
namgrpings = fieldnames(files_in.grouping);
Catena = [];

for pp = 1:length(tpnames),
    pp
	pvol = load(strcat(files_in.path,tpnames{pp}));
	tvol = niak_normalize_tseries(pvol.tseries,opt)';

	%% verify presence of mask
	%if isfield(files_in,'mask'), if pp == 1, 
	%		[hdr, mask] = niak_read_vol(files_in.mask);
	%		loc = find(vol > 0); clear hdr vol;
	%	end;end
	
	Catena = cat(2,Catena,tvol);

	%Keep in mind variables
	for gg = 1:length(namgrpings),
		if pp == 1,grouping.(namgrpings{gg}) = [];end
		
        %Finding which grouping its part of
        for ss = 1:length(files_in.grouping.(namgrpings{gg}))
            if ~isempty(strfind(tpnames{pp},files_in.grouping.(namgrpings{gg}){ss})), 
                tgrp = ss;
            end
        end
		grouping.(namgrpings{gg}) = [grouping.(namgrpings{gg}) tgrp.*ones(1,size(tvol,2))];	
	end

	%time points must be second dimension
end

ConcatResults.grouping_legend = files_in.grouping;
ConcatResults.tseries = Catena;
ConcatResults.grouping = grouping;

save(files_out,'ConcatResults');