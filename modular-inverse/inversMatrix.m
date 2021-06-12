function [ A1 ] = inversMatrix( A, n )
%inversMatrix merupakan  fungsi untuk menghitung matrix Zn dalam modulo n

r = round(mod(det(A),n));
if (gcd(n,r)==1)
    [d, s, t] = gcd(n,r);
    A1 = mod(round(t*det(A)*inv(A)),n);
else
    fprintf('Matrix tidak memiliki determinan')   
end