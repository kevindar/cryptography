function [newstate] = MixColumns(state)
    % Rijndael's Galois Field
    newstate = zeros(size(state));
    RGF = [2 3 1 1; 1 2 3 1; 1 1 2 3; 3 1 1 2];
    for row = 1:4
        for col = 1:4
            gal = RGF(row,:);
            val = zeros(1,4);
            for e = 1:4
                val(e) = state(e,col);
                if (gal(e) >= 2)
                    val(e) = 2 * val(e);
                    if (val(e) > 255)
                        val(e) = bitxor(val(e), hex2dec('1B'));
                    end
                    if (gal(e) == 3)
                        val(e) = bitxor(val(e), state(e,col));
                    end
                    if (val(e) > 255)
                       val(e) = bitand(val(e), 255); 
                    end
                end
            end
            newstate(row,col) = bitxor(bitxor(bitxor(val(1), val(2)), val(3)), val(4));
        end
    end
end