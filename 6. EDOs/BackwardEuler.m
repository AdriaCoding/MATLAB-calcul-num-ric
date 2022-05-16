function [x,Y] = BackwardEuler(f,I,y0,n)
    
    % resol dY/dx = f(x,Y) y(x0) = y0 (VECTORIAL)
    % amb metode Yi+1 = Yi + hf(x+1,Y+1)

    % f: vect_columna -> vect_columna
    % I = [x0,xn]
    % Y = [Y0; ...;Yn] on Yi es vect fila
    % n = nombre de passos que fem
    
    Y = zeros(n+1, length(y0));
    x = zeros(n + 1, 1);
    h = abs(I(1) - I(end))/n;
    Y(1,:) = y0; x(1) = I(1);
    for i = 1: n
       x(i+1) = x(i) + h;
       g = @(T) -T + Y(i,:) + h*f(x(i+1), T) ;
       Y(i+1,:) = fsolve(g, y0);      
    end
end
