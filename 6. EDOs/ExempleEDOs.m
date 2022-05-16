clear all; close all; clc;

f = @(x,y) 2*x*y+y^2*sin(y);
y0 = 1;
nsteps = 210;


[x,Y] = ode45(f,[0,5],y0);
figure(1), plot(x,Y,'.'); hold on;

[x,Y] = Euler(f,[0,5], y0, nsteps);
plot(x,Y,'o');

[x,Y] = BackwardEuler(f,[0,5], y0, nsteps);
plot(x,Y,'*');
legend("ode45", "Euler", "BackwardEuler")