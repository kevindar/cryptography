% plain1 = {'19', 'a0', '9a', 'e9'; '3d', 'f4','c6','f8';'e3','e2','8d','48';'be','2b','2a','08'};
plain1 = {'32', '88', '31', 'e0'; '43', '5a','31','37';'f6','30','98','07';'a8','8d','a2','34'};

% key1 = {'a0', '88', '23', '2a'; 'fa', '54','a3','6c';'fe','2c','39','76';'17','b1','39','05'};
key1 = {'2b', '28', 'ab', '09'; '7e', 'ae','f7','cf';'15','d2','15','4f';'16','a6','88','3c'};

plain = reshape(hex2dec(plain1),size(plain1))
key = reshape(hex2dec(key1),size(key1))

cipher = AES(plain, key);
decipher = DecryptAES(cipher, key);

display(cipher);
display(decipher);