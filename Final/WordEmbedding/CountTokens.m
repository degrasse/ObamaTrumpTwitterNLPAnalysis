function [ count ] = CountTokens(TokenzedCell)

count = 0;
for i = 1:size(TokenzedCell, 1)
    cur_cell = TokenzedCell{i};
    add_me = size(cur_cell,1);
    count = count + add_me;
end
    

end