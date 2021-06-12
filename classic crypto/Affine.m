function str = Affine(string, key1, key2)
    str = [];
    for i = 1:length(string)
        x = string(i);
        if     (x == 32)             str(end+1) = x; continue
        elseif (x >= 65 && x <= 90)  y = x - 65;
        elseif (x >= 97 && x <= 122) y = x - 97;
        else                         continue;
        end
        y = (key1 * y + key2);
        str(end+1) = mod(y, 26) + 65;
    end
    str = char(str);
end
