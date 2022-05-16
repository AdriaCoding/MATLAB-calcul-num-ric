function [y] = legenval(coefs, x);
y = 0;
for i = 1 : size(coefs)
    y = y + coefs(i)*legendreP(i-1,x);
end
    