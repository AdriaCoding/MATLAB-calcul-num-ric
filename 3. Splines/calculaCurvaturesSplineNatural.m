function d2S = calculaCurvaturesSplineNatural(x,y)
% la idea es resoldre el sistema tridiagonal aquell
i = 3 : length(x)-1;
lamda = ( x(i+1) - x(i) ) ./ ( x(i+1) - x(i-1) );

i = 2 : length(x)-2;
mu = (x(i) - x(i-1)) ./ ( x(i+1) - x(i-1) );

e = zeros(1 , length(x)-2) + 2;

A = diag(lamda, -1) + diag(e) + diag(mu, 1);

i = 2 : length(x)-1;
d = 6 ./( x(i+1) - x(i-1) ) .* ( ( (y(i+1)-y(i)) ./ (x(i+1) - x(i)) ) - (y(i)-y(i-1)) ./ (x(i) - x(i-1)) );

d2S = A\d';
d2S = [0; d2S; 0];





