clear; close all; clc;

nmax = 14;

f = @(x) ( exp(-x) + 0.5 * exp(-(x-4).^2) );
a = 0; b = 5; 
% el valor exacte de la integral, segons enunciat
I = exp(-a) - exp(-b) + sqrt(pi)*(erf(b-4) - erf(a-4))/4; 

%    Aproximació per Newton - Cotes     %

Errnewt = []; 
for n = 1:nmax
    x = linspace(a,b,n + 1);
    w = CurvSimples(x,a,b);
    Ia = f(x) * w;
    if n == 4
        lol = Ia
    end
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
