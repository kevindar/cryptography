function str = DecipherMultiplicative(string, key)
    str = [];
    [p, z] = gcd(key,26);
    for i = 1:length(string)
        x = string(i);
        if     (x == 32)             str(end+1) = x; continue
        elseif (x >= 65 && x <= 90)  y = x - 65;
        elseif (x >= 97 && x <= 122) y = x - 97;
        else                         continue;
        end
        str(i) = mod((y * z), 26) + 97;
    end
    str = char(str);
end