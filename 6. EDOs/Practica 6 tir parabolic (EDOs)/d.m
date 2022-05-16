function [dist] = d(theta,v0,f,a,b)
ci = @(theta) [0; 0; v0*cos(theta); v0*sin(theta)];
[t,Y]=ode45(f,[a,b],ci(theta), odeset('Events',@aterra) );
figure(3), title('iteracions de la bibiseccio'), hold on
plot(Y(:,1), Y(:,2), '-'); 
dist = Y(end,1);

if (theta == pi/4)
    instant_aterratge = t(end)
end

function [posicio_y, isterminal, direction] = aterra(t,y)
    posicio_y = y(2);   % hi ha event quan y(1) = 0
    isterminal = 1;     % si hi ha event ode45 s'atura
    direction = 0;     % mirem els zeros nomé quan y(i) decreix
                        % per no pillar el primer
end


end

