function [res] = SubBytes(state)
    S = load('SBox.mat');
    res = zeros(size(state));
    
    if numel(res) == 16
        for i = 1:4
            for j = 1:4
                res(i,j) = S.SBox(state(i,j) + 1);
            end
        end
    else
        for k = 1:4
            res(k,:) = S.SBox(state(k,:) + 1);
        end
    end
end