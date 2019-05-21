%Launch_kmeans_on_Concatenated

resolutions = 2:50;

load('F:\MyStudies\TemporalModes\Concatenatedtseries100\RestTask_No_LB.mat');

data = ConcatResults.tseries;

opt.type_init = 'kmeans++';


for ii = 1:length(resolutions),
    ii
    opt.nb_classes = resolutions(ii);
    [part,gi,i_intra,i_inter] = niak_kmeans_clustering(data,opt);

    save(strcat('F:\MyStudies\TemporalModes\Concatenatedtseries100\RestTask_No_LB_kmeans_',num2str(resolutions(ii)),'clusters.mat'), 'part','gi','i_intra','i_inter','ConcatResults')
end