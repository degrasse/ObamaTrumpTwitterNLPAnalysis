
 stopWords = urlread(stopwordsURL);
            stopWords = textscan(stopWords,'%s','Delimiter',',');
            stopWords = stopWords{1}(:);
            
            % remove special characters in tokenization
            delimiters = {' ','$','/','\','.','-',':','&','*',...
                            '+','=','[',']','?','!','(',')','{','}',',',...
                            '"','>','_','<',';','%'};
            
            % iterate over tweets
            tokenized = cell(size(tweetsO));
            word_list_O = {};
            
            for i = 1:size(tweetsO)
                % lower case 
                tweet = lower(tweetsO{i});
                % remove numbers
                tweet = regexprep(tweet, '[0-9]+','');
                % remove URLs
                tweet = regexprep(tweet,'(http|https)://[^\s]*','');
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
                        tokens = tokens(~ismember(tokens, stopWords));
                        % remove one character words
                        tokens = tokens(cellfun('length',tokens) > 1);
                        % store tokens
                        tokenized{i,1} = tokens;
                        word_list_O = [word_list_O;tokens];
                end
            end
            varargout = {word_list_O};
            
        
            
            % iterate over tweets
            tokenized = cell(size(tweetsT));
            word_list_T = {};
            
            for i = 1:size(tweetsT)
                % lower case 
                tweet = lower(tweetsT{i});
                % remove numbers
                tweet = regexprep(tweet, '[0-9]+','');
                % remove URLs
                tweet = regexprep(tweet,'(http|https)://[^\s]*','');
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
                        tokens = tokens(~ismember(tokens, stopWords));
                        % remove one character words
                        tokens = tokens(cellfun('length',tokens) > 1);
                        % store tokens
                        tokenized{i,1} = tokens;
                        word_list_T = [word_list_T;tokens];
                end
            end
            varargout = {word_list_T};
    