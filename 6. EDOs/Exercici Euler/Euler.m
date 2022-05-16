function [x,Y] = Euler(f,I,y0,n)
    
    Y = zeros(length(y0),n + 1);
    h = abs(I(1) - I(end))/n;
    Y(:,1) = y0; x(1) = I(1);
    for i = 1: n
       x(i+1) = x(i) + h;
       Y(:,i+1) = Y(:,i) + h*f(x(i), Y(:,i));       
    end
end

