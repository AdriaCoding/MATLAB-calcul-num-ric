clear; close all; clc;

R = 0.00132; g = [0; -9.8]; v0 = 100; theta = pi/4;
  % y = [x1(t); x2(t); v1(t); v2(t)]
f = @(t,y) [y(3); y(4);-R*norm(y(3:4))*[y(3);y(4)] + g]; a = 0; b = 15; 
y0 = [0; 0; v0*cos(theta); v0*sin(theta)];

%Solucio amb funcions intrinseques de Matlab
[t,Y]=ode45(f,[a,b],y0);
figure(1), hold on
plot(Y(:,1), Y(:,2), '* '); 
% plot(Y(:,3), Y(:,4), '. '); 

% (1) Solucio amb el metode d'Euler

npassos = 20;
[t,Y]=Euler(f,[a,b],y0,npassos);
figure(1), title('Euler meu vs ode45'), hold on
plot(Y(:,1), Y(:,2), '* '); legend ('x(t) amb ode45', 'x(t) amb Euler');
% plot(Y(:,3), Y(:,4), '. '); 
x10 = [Y(end,1), Y(end,2)]

% (2) Analisi errors del Euler proposat a l'enunciat

[t2,Y2]=Euler(f,[a,b],y0,2*npassos);
Xm = Y(end,1:2);   X2m = Y2(end,1:2); 
E = norm(Xm - X2m);
r = E/norm(X2m)
n_xifres_correctes = - log10(r)

% (3) Gràfica de convergencia
Era = [];
Err = [];
N = 400;
for n = 1:N
    [t,Y]=Euler(f,[a,b],y0,n);
    [t2,Y2]=Euler(f,[a,b],y0,2*n);
    Xm = Y(end,1:2);   X2m = Y2(end,1:2); 
    Era = [Era, norm(Xm - X2m)];
    Err = [Err, Era(end)/norm(X2m)];
end
figure (2);
h = (b-a)./(1:n);
plot ( -log10 (h) , log10 (Err) );
title ('log10(h) vs log10(Err)'); 

% (4) Vaina dels events
theta1 = pi/4;
distancia_tir_inicial = d(theta1,v0,f,a,b)

% (5) d(theta) = 500;
g = @(thet) d(thet, v0, f, a,b) - 500;
thetabona = bibiseccio(g, 0.1, pi/4,1e-10)
d(thetabona,v0,f,a,b)


