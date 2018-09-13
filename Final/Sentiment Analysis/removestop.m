function [output] = removestop(input)
for  i = 1:size(input)
    output(i,:) = strrep(input(i,:), stopWords, ' ');
    
end
end

    
  