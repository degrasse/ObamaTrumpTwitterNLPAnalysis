load 'finalData.mat'
%Data Prep
hi = OneDimObama(~cellfun('isempty',OneDimObama));
bye = OneDimTrump(~cellfun('isempty',OneDimTrump));
cellArrayCharVec = cellstr(hi);
cellArrayCharVec2 = cellstr(bye);
ObamaDocuments = tokenizedDocument(cellArrayCharVec);
TrumpDocuments = tokenizedDocument(cellArrayCharVec2);



%Word Embedding: Trump
embTrump = trainWordEmbedding(TrumpDocuments);
wordsTrump = embTrump.Vocabulary;

%Word Embedding: Obama
embObama = trainWordEmbedding(ObamaDocuments);
wordsObama = embObama.Vocabulary;
Z = word2vec(embObama,wordsObama);
XY = tsne(Z);

% Cluster analysis Obama: Discover 25 clusters using kmeans
cidx2 = kmeans(Z,25,'dist','sqeuclidean');
figure
textscatter(XY,wordsObama, ...
    'ColorData',categorical(cidx2));
title("Word Embedding t-SNE Plot- Obama")
axis off
 

% Cluster analysis Trump: Discover 25 clusters using kmeans

Z1 = word2vec(embTrump,wordsTrump);
XY = tsne(Z1);
cidx1 = kmeans(Z1,25,'dist','sqeuclidean');
figure 
textscatter(XY,wordsTrump, ...
    'ColorData',categorical(cidx1));
title("Word Embedding t-SNE Plot- Trump")
axis off





% textscatter(XY,wordsTrump)
% title('Trump Word Embedding')
% axis off



% textscatter(XY,wordsObama)
% title('Obama Word Embedding')
% axis off



