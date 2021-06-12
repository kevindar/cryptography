function [state] = AES(state, key)
    % get every round key
    keyRnd = KeySchedule(state, key);
    % initial round
    state = bitxor(state, cell2mat(keyRnd(:,1)));
    % 10 round
    for round = 1:10
        % Byte Substitution
        state = SubBytes(state);
        % Shift Rows
        state = ShiftRows(state);
        % Mix Columns
        if (round ~= 10)
            state = MixColumns(state);
        end
        % XOR with Round Key
        state = bitxor(state, cell2mat(keyRnd(:,round+1)));
    end
end