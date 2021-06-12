text = {'32' '88' '31' 'e0';
		'43' '5a' '31' '37';
		'f6' '30' '98' '07';
		'a8' '8d' 'a2' '34'}
    
ckey = {'2b' '28' 'ab' '09';
        '7e' 'ae' 'f7' 'cf';
		'15' 'd2' '15' '4f';
		'16' 'a6' '88' '3c'}
    
text = reshape(hex2dec(text), size(text)); 
ckey = reshape(hex2dec(ckey), size(ckey));

cipher = AES(text, ckey);
display(cipher);

atLast = DecryptAES(cipher, ckey);
display(atLast);