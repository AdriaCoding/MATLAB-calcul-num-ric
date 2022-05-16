clear; close all; clc;
%x = [w0, w1, w2, z1]

x0 = [2/5 ; 2/5 ; 2/5 ; 0.5];
niter = 20;

X = zeros(size(x0));
xim1 = x0;
r = zeros(niter,1);

f = @(x) [-1 + x(1)  + x(2) + x(3)/2;
        -1/3 + x(1)  + x(2)*x(4).^2 ;
        -1/5 + x(1)  + x(2)*x(4).^4 ;
        -1/7 + x(1)  + x(2)*x(4).^6 ];
    
solbona = fsolve(f,x0)

for i = 1:niter
    xi = xim1 + -Jf(xim1)\f(xim1);
    X = [X,xi];
    xim1 = xi;
    r(i) = norm(xi - solbona)/norm(solbona);
end
r = [norm(x0 - solbona)/norm(solbona) ; r];
solnewt = X(:, end)

plot (0:niter, log10(r))
