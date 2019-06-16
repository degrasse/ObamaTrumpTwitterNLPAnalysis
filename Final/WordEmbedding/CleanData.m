load 'trumptweets.mat'
load 'obama_clean_word_list.mat'

newObama= word_list(~cellfun('isempty',word_list));
newTrump = trumptweets(~cellfun('isempty',trumptweets));
 
obamaTokens = tokenize(newObama);
newTokensO =obamaTokens(~cellfun('isempty',obamaTokens));

countO = CountTokens(newTokensO);
OneDimObama = FixCells(newTokensO,countO);

trumpTokens = tokenize(newTrump);

newTokens =trumpTokens(~cellfun('isempty',trumpTokens));

countT = CountTokens(newTokens);
OneDimTrump = FixCells(newTokens,countT);

save finalData.mat
