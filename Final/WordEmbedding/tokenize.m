function [tokenized,varargout] = tokenize(tweets,stopwordsURL)
            % load stop words data
            stopwordsURL ='http://www.textfixer.com/resources/common-english-words.txt';
            stopWords = urlread(stopwordsURL);
            stopWords = textscan(stopWords,'%s','Delimiter',',');
            stopWords = stopWords{1}(:);
            
            % remove special characters in tokenization
            delimiters = {' ','$','/','.','-',':','&','*',...
                            '+','=','[',']','?','!','(',')','{','}',',',...
                            '"','>','_','<',';','%','#','\','@','â'':',''''};
            
            % iterate over tweets
            tokenized = cell(size(tweets));
            word_list = {};
            
            for i = 1:size(tweets)
                % lower case 
                tweet = lower(tweets{i});
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
                        tokens = tokens(cellfun('length',tokens) > 2);
                        % store tokens
                        tokenized{i,1} = tokens;
                        word_list = [word_list;tokens];
                end
            end
            varargout = {word_list};
        end