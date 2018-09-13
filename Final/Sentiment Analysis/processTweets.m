classdef processTweets
    
    
    methods (Static)
        

        
        function [tokenized,varargout] = tokenize(tweets,stopwordsURL)
            % load stop words data
            stopWords = urlread(stopwordsURL);
            stopWords = textscan(stopWords,'%s','Delimiter',',');
            stopWords = stopWords{1}(:);
            
            delimiters = {' ','$','/','.','-',':','&','*',...
                            '+','=','[',']','?','!','(',')','{','}',',',...
                            '"','>','_','<',';','%'};
            
            
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
                        % tokenize the content 
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
                        word_list = [word_list;tokens];
                end
            end
            varargout = {word_list};
        end
        
        function scores = scoreSentiment(tweets,scoreFile,stopwordsURL)
            % load AFINN data
            AFINN = readtable(scoreFile,'Delimiter','\t','ReadVariableNames',0);
            AFINN.Properties.VariableNames = {'Term','Score'};
            % tokenize tweets
            tokenized = processTweets.tokenize(table2cell(tweets),stopwordsURL);
            
            % compute sentiment scores
            scores = zeros(size(tokenized));
            for i = 1:length(tokenized)
               
                    % compute the sentiment score
                    scores(i) = sum(AFINN.Score(ismember(AFINN.Term,tokenized{i})));
               % end
            end
        end
        
     
    end
    
end

