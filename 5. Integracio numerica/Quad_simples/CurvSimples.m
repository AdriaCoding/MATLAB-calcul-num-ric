function [w] = CurvSimples(x, a, b)
%la funcio calcula els pesos d'integracio (wi's) de Newton-Cotes
n = length(x) - 1;
%imposem que la quadratura és d'ordre n

A = zeros(n+1);
int = zeros(n+1,1);

for i = 1:n+1
    for j = 1:n+1
        A(i,j) = x(j).^(i-1);
    end
    int(i) = (b.^i - a.^i)/i;
end
w = linsolve(A,int);