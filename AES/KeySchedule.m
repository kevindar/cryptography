function [res] = KeySchedule(state, key)
    rcon = {'01' '02' '04' '08' '10' '20' '40' '80' '1b' '36';
            '00' '00' '00' '00' '00' '00' '00' '00' '00' '00';
            '00' '00' '00' '00' '00' '00' '00' '00' '00' '00';
            '00' '00' '00' '00' '00' '00' '00' '00' '00' '00'};
    collen = 4;
    keyRnd = [];
    rcon = reshape(hex2dec(rcon), size(rcon));
    res = { key };
    for round = 1:10
        prevKey = cell2mat(res(round));
        rot = circshift(prevKey(:,collen), -1);
        a = prevKey(:,1); 
        b = SubBytes(rot);
        c = rcon(:,round);
        keyRnd(:,1) = bitxor( bitxor(a,b), c );
        for col = 2:collen
            a = prevKey(:,col);
            b = keyRnd(:,col-1);
            keyRnd(:,col) = bitxor( a,b );
        end
        res{end+1} = keyRnd;
    end
end