function [new_cell] = FixCells(TokenizedTweet, count)
new_cell = cell(count, 1);


for i = 1:size(TokenizedTweet)
    cur_token = TokenizedTweet{i};
    disp(cur_token)
    for j = size(cur_token,1)
        cur_word = cur_token{j};
        new_cell{i} = cur_word;
    end
end    
     
end
