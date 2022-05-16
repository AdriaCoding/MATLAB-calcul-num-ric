clear all
[x,Y] = ode45(@f1,[0,5],1);
figure(1), plot(x,Y,'-o'), xlabel('x'),ylabel('Y')

alpha=[1;1]
[t,Y] = ode45(@f2,[0,1],alpha);
figure(2), plot(t,Y,'-o'), xlabel('t'),ylabel('Y')
legend('x','y')

alpha=[1;0]
[t,Y] = ode45(@f3,[0,10],alpha);
figure(3), plot(t,Y,'-o'), xlabel('t'),ylabel('Y')
legend('y1','y2')
figure(4), plot(Y(:,1),Y(:,2),'-o'), xlabel('y1'),ylabel('y2')


