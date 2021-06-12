function[y] = FastExp(a,x,n)    
    y = 1;
    x = de2bi(x);
    for i = 1 : length(x)
       if(x(i)==1)
           y = mod(y*a,n);
       end
       a = mod(a^2,n);
    end
end