load ('FinalWorkspace.mat');
load('workspace_final.mat');
disp('Finished Loading Workspaces')

run ('wordEmbedding.m');
run('sentimentAnalysis.m');
run('sentimentVisualization.m');
run('tweetFrequency.m');

disp('Analysis Complete')