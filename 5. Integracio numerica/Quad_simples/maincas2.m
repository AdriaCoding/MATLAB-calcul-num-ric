clear; close all; clc;

nmax = 14;

f = @(x) ( (1+ x.^2).^-1 );
a = -4; b = 4; 
% el valor exacte de la integral, segons enunciat
I = 2*atan(4); 

%    Aproximació per Newton - Cotes     %

Errnewt = []; 
for n = 1:nmax
    x = linspace(a,b,n + 1);
    w = CurvSimples(x,a,b);
    Ia = f(x) * w;
    Errnewt = [Errnewt ; abs(I - Ia)/I];
end
figure(1);
plot (log10(1:nmax), log10(Errnewt));
hold on;
%    Aproximació per Gauss- Legendre    %

% funcio canvi de variable per poder fer Gauss Legendre
phi = @(s) (s * (b-a) + b + a)/2;

ErrGL = [];
integraleh = [];
for n = 1:nmax
    [z,w] = QuadraturaGauss(n);
    Ia = w * f(phi(z)) * (b-a)/2;
    integraleh = [integraleh; Ia];
    ErrGL = [ErrGL ; abs(I - Ia)/I];
end
integraleh
plot (log10(1:nmax), log10(ErrGL));
title("log nombre punts vs log error");
legend("Newton-Cotes", "Gauss-Legendre");
