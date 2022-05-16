    clear; close all; clc

load malla.mat
figure;
plotMesh(X,T)
legend('malla inicial');

distorsio_inicial = calculaDistorsioMalla(X,T)

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y =  reshape(X(1:Nint,:),2*Nint,1);

%%
%Metode Newton
maxIter = 50; iter = 1; tol = 1e-8; res = zeros (maxIter, 1); res(1) = tol + 1;
while (iter < maxIter && res(iter) > tol)
    [dF] = numericalDerivative(F,y);
    [hF] = numericalHessian(F,y);
    incy = -hF\dF;
    y = y + incy;
    iter = iter + 1; 
    res(iter) = norm(incy)/norm(y);
end
%%
Xf = [reshape(y, Nint, 2);X(Nint+1:end,:)];
Distorcio_final = calculaDistorsioMalla(Xf,T)
Nombre_iterancions = iter

figure;
plotMesh(Xf,T)
legend('malla final');

figure;
plot(1:maxIter, log10(res))
legend('grafica convergencia');


% Completar el codi per determinar la posicio dels nodes interiors que
% minimitza la distorsio de la malla. 
% Abans de fer servir el metode de Newton, cal completar la funcio
% calculaDistorsioMalla
% ...
% ...
% ...
