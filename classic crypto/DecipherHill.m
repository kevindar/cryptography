function str = DecipherHill(string, key)
    str = [];
    % get string as alphabet and spaces only
    string = string(regexp(string,'[a-zA-Z\s]'));
    % get space char indices
    spaceIndices = regexp(string,'\s');
    % get as alphabet only for decrypting
    string = string(regexp(string,'[a-zA-Z]'));
    string = lower(string);
    [rows cols] = size(key);
    remainder = mod(length(string), rows);
    % strinng len should be divisable by size of row in the key matrice
    % so we can decode by multiplying the matrice
    if (remainder) return;
    end
    % error handling if key can't be inversed
    if (det(key) == 0) return;
    end
    % finding a decoder key
    % find congruence det(key) * S = 1 mod 26
    [~,S] = gcd(int64(det(key)),26);
    if (isempty(S)) return;
    end
    % get the adjoint matrice
    key = det(key)*inv(key);
    key = mod(key, 26);
    % multiply by congruence
    key = int64(key) * S;
    % final step using mod 26 to get the decoder key
    key = mod(key, 26);
    
    % reshape string to a matrice so it can be multiplied by key
    rowsize = length(string) / rows;
    str = reshape(string, rows, rowsize).';
    str = str - 97;
    str = str * double(key);
    str = mod(str, 26);
    % return in a form of 1d matrice, like a string
    str = reshape(str.',1,[]);
    % return as a lower case, indicating original text
    str = char(str + 97);
    % insert space char
    if ~(isempty(spaceIndices))
        c = false(1,length(str)+length(spaceIndices));
        c(spaceIndices) = true;
        result = nan(size(c));
        result(~c) = str;
        result(c) = ' ';
        str = char(result);
    end
end