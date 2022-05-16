function [A] = Jf(x)

A = [1, 1, 1/2 , 0;
   1, x(4).^2 , 0, 2*x(3)*x(4);
   1, x(4).^4 , 0, 4*x(3)*x(4).^3;
   1, x(4).^6 , 0, 6*x(3)*x(4).^5 ];