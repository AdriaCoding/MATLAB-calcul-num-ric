function [x] = bibiseccio(f,a,b,tol)

if f(a)*f(b) > 0
    error('Interval inadequat')
end
err = tol +1;
while err > tol
    x = (a+b)/2;
    if f(a)*f(x) > 0
        a = x;
    else
        b = x;
    end
    err = abs((a-b)/x);
end
x = a;
