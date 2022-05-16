clear; close all; clc;

f = @(x) sin(exp(2*x));
eps = 1e-3;
a = 0; b = 2;
Int_wolfram = 0.315904285080057321848408472052181686742547640526611378636;

punts = [a];
[I,punts] = vaina_rec (f,a,b,eps, punts);
format long
I
ERROR_DE_APROXIMACIO = Int_wolfram - I
NOMBRE_DE_INTERVALS = length(punts) - 1

figure(1);
fplot(f,[0,2]);
hold on;
plot (punts,-1, 'x')
legend("funció", "punts")
function [I,punts] = vaina_rec(f,a,b,eps, punts)
    pm = (a+b)/2;
    Err = abs( S(f,a,b) - S(f,a, pm) - S(f, pm, b) );
    if ( Err < (b-a)*eps )
        I = S(f,a,b);
        punts = [punts,b];
    else
        [Ia,punts] = vaina_rec(f,a, pm, eps, punts);
        [Ib,punts] = vaina_rec(f,pm,b,eps, punts);
        I = Ia + Ib;
    end
    
end

function [I] = S(f,a,b)
h = (b-a)/2;    w0 = h/3;   w1 = 4*w0;  w2= w0;
I = f(a)*w0 + f((a+b)/2)*w1 + f(b) * w2;
end

