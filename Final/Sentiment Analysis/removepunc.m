function [output] = removepunc(input)
p = [".", "?","!", ",", ":", '"', ";", "-", "'s", "(", ")", "'", ];

for i = 1:size(input)
    output(i,:) = replace(input(i, :),p, " ");
end
end
