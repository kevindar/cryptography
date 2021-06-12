function str = DecipherAffine(cipher, key1, key2)
    str = [];
    [p, z] = gcd(key1, 26); 
    for i = 1:length(cipher)
        x = cipher(i); 
        if     (x == 32)             str(end+1) = x; continue
        elseif (x >= 65 && x <= 90)  y = x - 65;
        elseif (x >= 97 && x <= 122) y = x - 97;
        else                         continue  
        end
        str(end+1) = mod((y - key2)*z, 26) + 97;
    end 
    str = char(str);
end