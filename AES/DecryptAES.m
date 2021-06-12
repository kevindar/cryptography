function [state] = DecryptAES(state, key)
    % get every round key
    keyRnd = KeySchedule(state, key);
    % first round
    state = bitxor(state, cell2mat(keyRnd(:,11)));
    % 10 round
    for round = 10:-1:1
        % inverse Shift Rows
        state = InvShiftRows(state);
        
        % inverse Byte Substitution
        state = InvSubBytes(state);
        
        % Add (XOR) with Round Key
        state = bitxor(state, cell2mat(keyRnd(:,round))); 
        
        % inverse Mix Columns
        if (round ~= 1)
            state = InvMixColumns(state);
        end    
    end
end