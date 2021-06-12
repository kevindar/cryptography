%Cryptography uses residue matrices: matrices in all elements are in Zn. All operations
%on residue matrices are performed the same as for the integer matrices except that
%the operations are done in modular arithmetic. One interesting result is that a residue
%matrix has a multiplicative inverse if the determinant of the matrix has a multiplicative
%inverse in Zn. In other words, a residue matrix has a multiplicative inverse if gcd
%(det(A), n) = 1.
close all;
clear all;
n=26;
A=[3 5 7 2;1 4 7 2;6 3 9 17;13 5 4 16];
md=moddet(A,n)
if(gcd(md,n)==1)
 mdInv=MultInv(n,md)
 Ainv=modMatrixInv(A,mdInv,n)
end 


