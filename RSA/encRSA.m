% RSA encryption function
% input Message M, kunci e, dan modulus n
function C = encRSA(M, e, n)

    p = 8831;
    q = 9769;
    w = (p-1)*(q-1); %86251440

    [d,~,t] = gcd(w,e);
    if d==1
        d = mod(t+w, w); %private key
    end

    C = FastExp(M, e, n); %hasil cipher

    fprintf('Pesan : %d\n',M)
end