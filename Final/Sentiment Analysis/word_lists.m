
 stopWords2 = urlread(stopwordsURL);
            stopWords2 = textscan(stopWords2,'%s','Delimiter',',');
            stopWords2 = stopWords2{1}(:);
            stopWords2 = split(string(stopWords2),','); 
            % remove special characters in tokenization
            delimiters = {' ','$','/','\','.','-',':','&','*',...
                            '+','=','[',']','?','!','(',')','{','}',',',...
                            '"','>','_','<',';','%'};
            
          tokenizedTrump = cell(size(trumptweets));
            word_list_T = {};

   for i = 1:length(Trumptweets)
                % lower case 
                tweet = lower(trumptweets{i});
                % remove numbers
                tweet = regexprep(tweet, '[0-9]+','');
                % remove URLs
                tweet = regexprep(tweet,'(http|https)://[^\s]*','');
                %tweet = regexprep(tweet, 
                %tweet = removeWords(tweet, stopWords);
                % check if tweet is still valid
                if ~isempty(tweet)
                        % tokenize the content - returns a nested cell array
                        tokensT = textscan(tweet,'%s','Delimiter',delimiters);
                        tokensT = tokensT{1}(:);
                        % remove unicode characters
                        tokensT = regexprep(tokensT,'\\u','');
                        % remove empty elements
                        tokensT = tokensT(~cellfun('isempty',tokensT));
                        % remove stopwords 
                        %tokens = tokens(~ismember(tokens, stopWords));
                        tokensT = tokensT(~ismember(tokensT, stopWords2));
                         tokensT(ismember(tokensT, stopWords)) = [];
                        
                        % remove one character words
                        tokensT = tokensT(cellfun('length',tokensT) > 2);
                        % store tokens
                        tokenizedTrump{i,1} = tokensT;
                        word_list_T = [word_list_T;tokensT];
                end
            end
            varargout = {word_list_T};
 
  tokenizedObama = cell(size(obamatweets));          
  word_list_O = {};

   for i = 1:length(obamatweets1)
                % lower case 
                tweet = lower(obamatweets{i});
                % remove numbers
                tweet = regexprep(tweet, '[0-9]+','');
                % remove URLs
                tweet = regexprep(tweet,'(http|https)://[^\s]*','');
               %tweet = removeWords(tweet, stopWords);
                % check if tweet is still valid
                if ~isempty(tweet)
                        % tokenize the content - returns a nested cell array
                        tokens = textscan(tweet,'%s','Delimiter',delimiters);
                        tokens = tokens{1}(:);
                        % remove unicode characters
                        tokens = regexprep(tokens,'\\u','');
                        % remove empty elements
                        tokens = tokens(~cellfun('isempty',tokens));
                        % remove stopwords 
                        %tokens = tokens(~ismember(tokens, stopWords));
                        tokens = tokens(~ismember(tokens, stopWords2));
                         tokens(ismember(tokens, stopWords)) = []; 
                        % remove one character words
                        tokens = tokens(cellfun('length',tokens) > 2);
                        % store tokens
                        tokenizedObama{i,1} = tokens;
                        word_list_O = [word_list_O;tokens];
                end
            end
            varargout2 = {word_list_O};    
            
            
            
            
          
            
            
  