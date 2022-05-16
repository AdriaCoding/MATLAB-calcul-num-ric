function [A,b] = eqnormals_L(m, f)

%  phi evalua el polinomi de legendre de grau i al punt x
phi = @(i,x) legendreP(i,x);

A = zeros(m+1); b = zeros(m+1,1);
for i = 1 : m+1
    g = @(x) (phi(i-1,x) .* phi(i-1,x));
    A(i,i) = integral(g , -1 , 1);
    h = @(x) (phi(i-1,x) .* f([x]));
    b(i) = integral(h, -1, 1);
end

end





