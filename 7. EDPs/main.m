% 
clear all; close all; clc

%Solution of the 1D parabolic equation in (a,b)x(0,T)
a = 0; b = 1; % end points
nu = 1;       % conductivitat termica
T = 0.2;      % final time

m = 20;         % Number of spatial intervals 
Ax = (b-a)/m;   % discretization size
x = a:Ax:b;     % nodes

nOfSteps = 2000;  % Number of time steps;
    %nOfSteps=ceil(T/(0.5*Ax^2)) %ALWAYS works
At = T/nOfSteps; % Time step 

%initial condition (must be column vector)
f = 1-2*abs(x-0.5)';
    %f = (sin(pi*x) + x.^2)'
% boundary conditions 
t = 0:At:T; 
ua = zeros(size(t)); ub=ua; %ub=t;

nOfStepsPlot = ceil(nOfSteps/10); %about 10 plots

%Solution computation
U_ex = parabolicEuler(x,Ax,At,nu,nOfSteps,nOfStepsPlot,ua,ub,f);
U_im = backwardEuler(x,Ax,At, nu ,nOfSteps,nOfStepsPlot,ua,ub,f);

%Postprocess
figure(1); plot(x,U_ex); title('Forward Euler (explicit)');
hold on; plot(x, U_ex(:,1), '*'); % t = 0
s1 = strcat('nº of t steps = ', num2str(nOfSteps));
s2 = strcat('m = ', num2str(m));
s3 = strcat('nu = ', num2str(nu));
legend(s1,s2,s3)

figure(2); plot(x,U_im); title('Backward Euler (implicit)');
hold on; plot(x, U_im(:,1), '*'); % t = 0
legend(s1,s2,s3)
