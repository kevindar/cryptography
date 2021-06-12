% RSA decryption function
% input Ciphertext C, kunci d, dan modulus n
function M = encRSA(C, d, n)

M = FastExp(C, d, n)

fprintf('Pesan : %d\n',M) % hasil decrypt

end