gambar = imread('Teh dan kabut pesan.png');
Red = gambar(:,:,1);
Green = gambar(:,:,2);
Blue= gambar(:,:,3);

crypt = zeros(1,673);
baris = 1;
kolom = 1;

for n = 1:673
    if(kolom > 512)
        kolom = kolom - 512;
        baris = baris + 1;
        crypt(n) = Red(baris, kolom);
    end
        crypt(n) = Red(baris, kolom);
        kolom = kolom + 380;
end
teks = upper(char(crypt));