clear; close all; clc;


[nx] = newton_iter(3, @f, @df);
% [vect_x,vect_r, bbi] = biseccio_iter([-1, 0],niter,@f)

n = length(nx);
err = abs ( ( nx(1:n-1)-nx(2:n) ) ./ nx(2:n) );

lin = linspace(-1,4, 100000);
plot (lin, f(lin));
hold on 
plot (lin, zeros(1, 100000), 'k');
% plot (vect_x, f(vect_x),'*');
hold on
plot (nx, f(nx), 'bx');
plot (nx(end), f(nx(end)), 'rx');

figure(2)
plot (1:n-1, err)
title("Gràfica de convergencia");

Nombre_iteracions = n