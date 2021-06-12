function str = bruteAffine(cipher)
    ctext = [];
    for key1 = 1:26
        [p, z] = gcd(key1, 26); 
        for key2 = 1:26
            for i = 1:length(cipher)
                x = cipher(i); 
                if     (x == 32)             ctext(end+1) = x; continue
                elseif (x >= 65 && x <= 90)  y = x - 65;
                elseif (x >= 97 && x <= 122) y = x - 97;
                else                         continue  
                end
                ctext(end+1) = mod((y - key2)*z, 26) + 97;
            end 
            ctext = char(ctext);
            if (regexp(ctext, ' dan '))
                key1
                key2
                str = ctext;
                return;
            end
            ctext = [];
        end
    end
end