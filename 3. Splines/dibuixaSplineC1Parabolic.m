function [xd,yd,coeficients]=dibuixaSplineC1Parabolic(x,S);

xd = []; yd = []; coeficients = [];
x01 = [0:1/20:1]; %20 subintervals a cada interval

h=x(2:end)-x(1:end-1);
t=S(2:end)-S(1:end-1);


for i=1:length(x)-1;
    if(i == 1)
        b = t(i)/h(i);
        a = ( t(i) - b*h(i) )/ (h(i)^2);
        c = S(i);
    else
        b = ( 2*t(i-1) - b0*h(i-1) ) / h(i-1);
        a = ( t(i) - b*h(i) )/ (h(i)^2);
        c = S(i);   
    end
    
    b0 = b;
    
    xs = x(i)+x01*h(i); %valors de x a l'interval
    ys = a*(xs-x(i)).^2 + b*(xs-x(i)) + c;
    xd = [xd, xs]; yd = [yd, ys]; coeficients=[coeficients; a b c ];
end

