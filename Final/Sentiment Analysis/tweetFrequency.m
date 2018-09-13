scoreFile = 'scoreFile.txt';

stopwordsURL ='http://www.textfixer.com/resources/common-english-words.txt';
       stopWords2 = textscan(stopwordsURL,'%s','Delimiter',',');
            stopWords2 = stopWords2{1}(:);

  for i = 1:size(word_list_O)
      split1 = regexp(word_list_O{i,1},'\s', 'Split');
      word_list_O{i,1}  = strjoin(split1(~ismember(split1, stopWords2)), ' ');
      

  end
    for i = 1:size(word_list_T)
      split1 = regexp(word_list_T{i,1},'\s', 'Split');
      word_list_T{i,1}  = strjoin(split1(~ismember(split1, stopWords2)), ' ');
      

  end





  
dict_O = unique(word_list_O); 

%% remove empty string
DTM_O = zeros(6809,length(dict_O));              % Doc Term Matrix

for ii = 1:6809                            % loop over tokens
    [words,~,idx] = unique(word_list_O(ii, :));                     % get uniqe words
    wcountsO = accumarray(idx, 1);                           % get word counts
    cols = ismember(dict_O, words);                           % find cols for words
    DTM_O(ii,cols) = wcountsO;                                 % unpdate DTM with word counts
  
end
DTM_O(:,ismember(dict_O,{'#','@'})) = [];                       % remove # and @
dict_O(ismember(dict_O,{'#','@'})) = [];                        % remove # and @



% 

countObama = sum(DTM_O);                                           % get word count
labels = erase(dict_O(countObama >= 40),'@');                      % high freq words
pos = [find(countObama >= 40);countObama(countObama >= 40)] + 0.1;         % x y positions
figure                                                      % new figure
scatter(1:length(dict_O),countObama)                               % scatter plot
text(pos(1,1),pos(2,1)+3,cellstr(labels(1)),...             % place labels
    'HorizontalAlignment','center');
text(pos(1,2),pos(2,2)-2,cellstr(labels(2)),...
    'HorizontalAlignment','right');
text(pos(1,3),pos(2,3)-4,cellstr(labels(3)));
text(pos(1,3:end),pos(2,3:end),cellstr(labels(3:end)));
title('Frequent Words in Obama Tweets')      % add title
xlabel('Indices')                                           % x-axis label
ylabel(' Count')                                            % y-axis label
ylim([0 150])                                               % y-axis range

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dict_T = unique(word_list_T); 

DTM_T = zeros(11515,length(dict_T));              % Doc Term Matrix

for ii = 1:11515                             % loop over tokens
    [words,~,idx] = unique(word_list_T(ii, :));                     % get uniqe words
    wcountsT = accumarray(idx, 1);                           % get word counts
    cols = ismember(dict, words);                           % find cols for words
    DTM_T(ii,cols) = wcountsT;                                 % unpdate DTM with word counts

end
DTM_T(:,ismember(dict_T,{'#','@'})) = [];                       % remove # and @
dict_T(ismember(dict_T,{'#','@'})) = [];                        % remove # and @





countTrump = sum(DTM);                                           % get word count
labels = erase(dict_T(countTrump >= 35),'@');                      % high freq words
pos = [find(countTrump >= 35);countTrump(countTrump >= 35)] + 0.1;         % x y positions
figure                                                      % new figure
scatter(1:length(dict_T),countTrump)                               % scatter plot
text(pos(1,1),pos(2,1)+3,cellstr(labels(1)),...             % place labels
    'HorizontalAlignment','center');
text(pos(1,2),pos(2,2)-2,cellstr(labels(2)),...
    'HorizontalAlignment','right');
text(pos(1,3),pos(2,3)-4,cellstr(labels(3)));
text(pos(1,3:end),pos(2,3:end),cellstr(labels(3:end)));
title('Frequent Words in Trump Tweets')      % add title
xlabel('Indices')                                           % x-axis label
ylabel(' Count')                                            % y-axis label
ylim([0 150])                                               % y-axis range

