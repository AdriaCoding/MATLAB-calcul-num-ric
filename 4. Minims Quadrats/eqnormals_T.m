function [A,b] = eqnormals_T(m, f)

%  phi evalua el polinomi de Tcbhsachfbie de grau i al punt x
phi = @(i,x) chebyshevT(i,x);

A = zeros(m+1); b = zeros(m+1,1);
for i = 1 : m+1
    g = @(x) (phi(i-1,x) .* phi(i-1,x) ./ sqrt(1-x.^2) );
    A(i,i) = integral(g , -1 , 1);
    
    h = @(x) (phi(i-1,x) .* f([x]) ./ sqrt(1-x.^2) );
    b(i) = integral(h, -1, 1);
end

end

