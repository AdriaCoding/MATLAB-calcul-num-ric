% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la converg?ncia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 
clear; close all; clc;
 
% CAS 1
f=@(x,y) -y/(10*x+1); a=0; b=2;  y0=1;
yanal = @(x)(1./(1 + 10.*x).^(0.1));

% CAS2:   vy = (y, y') => vy' = (y', -y) = f(x,vy)
% f=@(x,y) [y(2); -y(1)]; a=0; b=50*pi;  y0=[1;0];
% yanal = @(x)cos(x);

%Solucio analitica
figure(1)
hold on
x = linspace(a,b,1000);
plot(x,yanal(x),'-') 
legend('sol. analitica')

%Solucio amb funcions intrinseques de Matlab
[x,Y]=ode45(f,[a,b],y0);
figure(1), hold on, plot(x,Y(:,1),'-'), legend('sol. analitica','ode45')

%Solucio amb el metode d'Euler
h=0.01;
npassos=ceil((b-a)/h); 
[x,Y]=Euler(f,[a,b],y0,npassos);
figure(1), hold on,plot(x,Y(1,:),'-'), legend('sol. analitica','ode45','Euler')

%Analisi errors del Euler (es lineal, com ha de ser)
h = 1;
err = [];
for i = 1:6
    npassos=ceil((b-a)/h(end)); 
    [x,Y]=Euler(f,[a,b],y0,npassos);
    err = [err, yanal(x(end)) - Y(1,end) ];
    h = [h,h(end)/10];
end
h(end) = [];
figure(2), plot(abs(log10(h)), log10(abs(err))), title("log(h) vs log(error al final)");
log10(h)
log10(err)

%Solucio amb el metode d'Euler enrera
% npassos=ceil((b-a)/h); 
% [x,Y]=BackwardEuler(f,[a,b],y0,npassos);
% figure(1), plot(x,Y,'-o')
% title('y')
% legend('sol. analitica','ode45','euler','euler enrera')
