function [y] = chebyval(coefs, x);
y = 0;
for i = 1 : size(coefs) 
    y = y + coefs(i)*chebyshevT(i-1,x);
end
    