% RSA encryption and decryption function
% Kevin Darmawan (06/2021)
clear all
clc
M = 150; % pesan yang di enkripsi

p = 8831; % random prime 1
q = 9769; % random prime 2
e = 1223; % public encrypt key
n = p*q; % system modulus 86270039
w = (p-1)*(q-1); % totient function

[d,s,t] = gcd(w,e);
% mencari inverse dengan euclidean
if d==1
    private = mod(t+w, w); %private decrypt key : 82584167
end

% cetak pesan
fprintf('Pesan = \n\n\t%d\n', M)
% hasil cipher
cipher = FastExp(M, e, n)
% hasil decipher
decipher = FastExp(cipher, private, n)
% cocokkan hasil decrypt dengan pesan
if isequal(M, decipher)
    fprintf('Hasil decipher dan pesan sama\n') 
else
    fprintf('Hasil decipher dan pesan berbeda!\n')
end