clear; close all; clc;

f = @(x) (1 ./(1+25 .*x .^2));
% f = @(x) cos(2*pi*x).*sin(pi*x);
lin = linspace(-1,1,100);
limits_eixos = [-1,1];
graumax = 8;
pas = graumax/4;

%Interpolació
figure(1)
fplot(f); s = ["f"];
hold on;
title ("polinomis interpoladors")
n = 101;
for n = 2 : pas : graumax
    x = linspace(-1,1,n+1);
    y = f(x); 
    p = polyfit(x,y,n);
    plot(lin,polyval(p,lin));
    s = [s, strcat("grau ", num2str(n))];
end
axis([-1, 1, -0.15, 1.1]);
legend (s);
title ("polinomis interpoladors")
n = 100;

% Minims quadrats discrets
n = 100
x = linspace(-1,1,n + 1);
y = f(x);
res1 = [];
figure(2);
fplot(f); s = ["f"];
hold on;
for m = 2 : pas : graumax
    p = polyfit(x,y,m);
    res1 = [res1, norm(f(x)-polyval(p,x))];
    plot(lin,polyval(p,lin));
    s = [s, strcat("p. de grau ", num2str(m))];
end
res1
axis([-1, 1, -0.15, 1.1])
legend (s);
title ("mins. quads. discrets");


% Minims quadrats continus amb polinomis de Legendre
res2 = [];
figure(3);
fplot(f); s = ["f"];
hold on;
for m = 2 : pas : graumax
    [A,b] = eqnormals_L(m,f);
    coefs = inv(A)*b;
    r = @(x) ( (f([x]) - legenval(coefs,x)).^2 );
    res2 = [res2, integral(r,-1,1)];
    plot(lin,legenval(coefs,lin));
    s = [s, strcat("p.L. de grau ", num2str(m))];
end
res2
axis([-1, 1, -0.15, 1.1]);
legend (s);
title ("mins. quads. Legendre");


% Minims quadrats continus amb polinomis de Tsaebiiehge
res3 = [];
figure(4);
fplot(f); s = ["f"];
hold on;
for m = 2 : pas : graumax
    [A,b] = eqnormals_T(m,f);
    coefs = inv(A)*b;
    r = @(x) ( ( (f([x]) - chebyval(coefs,x)).^2 )./ sqrt(1-x.^2) )  ;
    res3 = [res3, integral(r,-1,1)];
    plot(lin,chebyval(coefs,lin));
    s = [s, strcat("p.L. de grau ", num2str(m))];
end
res3
axis([-1, 1, -0.15, 1.1]);
legend (s);
title ("mins. quads. Txefbosafa");


