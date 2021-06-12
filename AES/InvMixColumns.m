function [state] = InvMixColumns(state)
     warning('off');
     % Rijndael Galois Field for AES Decryption
     RGF = [14 11 13 9; 9 14 11 13; 13 9 14 11; 11 13 9 14];
     % Galois Field 2^8-1 Polynomial: X^8 + X^4 + X^3 + X + 1
     gfA = gf(RGF,8,'D8+D4+D3+D+1');
     gfH = gf(state,8,'D8+D4+D3+D+1');
     % Rijndael Galois Multiplication
     state = gfA * gfH;
     state = double(state.x);
end