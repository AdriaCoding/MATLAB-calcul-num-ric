function [x] = newton_iter(x_inicial, f, df)
    
tol = 0.5 * 10e-5;

x = x_inicial;
eabs = []; 
i = 1;
while (i == 1) || (eabs(i-1) > tol && abs(f(x(i))) > tol) 
    x_prev = x(i);
    x = [x, x_prev - f(x_prev)/df(x_prev)];
    i = i+1; 
    eabs = [eabs , abs(x(i) - x_prev)];
end
end
