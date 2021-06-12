function str = DecipherPlayFair(string, key)
    str = [];
    string = char(string);
    spaceIndices = [];
    % set all to upper case for shifting
    string = lower(string);
    key = lower(key);
    % remove character that's not in the key
    temp = [];
    for i = 1:length(string)
        x = string(i);
        if (x == 32)
            spaceIndices(end+1) = 1 + length(temp) + length(spaceIndices);
            continue;
        end
        [row, col] = find(key == x, 1);
        if (isempty(row)) continue; end
        temp(end+1) = x;
    end
    string = char(temp);
    % string length should be divisible by 2
    % the algorithm should detect this with the same char
    % (x1 == x2), so it can fill the gap with 'X'
    len = length(string);    
    if (mod(len, 2) ~= 0) string(end+1) = 'x'; end
    % get key matrice size
    [rowK, colK] = size(key);
    % play-fair
    for i = 1:2:length(string)
        x1 = string(i);
        x2 = string(i+1);
        % find index in the key
        [row1, col1] = find(key == x1, 1);
        [row2, col2] = find(key == x2, 1);
        if (row1 == row2)
            move1 = col1 - 1;
            move2 = col2 - 1;
            if (move1 == 0) move1 = colK; end
            if (move2 == 0) move2 = colK; end
            str(i) = key(row1, move1);
            str(i+1) = key(row2, move2);
        elseif (col1 == col2)
            move1 = row1 - 1;
            move2 = row2 - 1;
            if (move1 == 0) move1 = rowK; end
            if (move2 == 0) move2 = rowK; end
            str(i) = key(move1, col1);
            str(i+1) = key(move2, col2);
        else
            str(i) = key(row1, col2);
            str(i+1) = key(row2, col1);
        end
    end
    str = char(str);
    % insert space char
    if ~(isempty(spaceIndices))
        c = false(1,length(str)+length(spaceIndices));
        c(spaceIndices) = true;
        result = nan(size(c));
        result(c) = ' ';
        result(~c) = str;     
        str = result;
    end
end