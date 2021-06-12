function [state] = InvShiftRows(state)
    for i = 2:4
        state(i, :) = circshift(state(i, :), [0, i-1]);
    end
end