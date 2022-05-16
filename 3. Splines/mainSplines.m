clear; clc;
% CALCUL I DIBUIX D'SPLINES
% Aquest script calcula i dibuixa l'Spline cubic C1 amb aproximaci? de les
% derivades, per als punts base i valors de la funcio a x i y.
%
% EXERCICIS:
% (1) Mira l'ajuda i el codi de la funcio dibuixaSplineCubic per veure que fa.
% (2) Implementa una funcio amb cap?alera 
%        function d2S = calculaCurvaturesSplineNatural(x,y)
%     que donats x i y, calculi les curvatures als punts base corresponents
%     a l'Spline natural. Descomenta les linies corresponents a l'Spline
%     natural a aquest codi. Observa els dos Splines. Son raonables els
%     resultats?
% (3) Implementa l'Spline C1 parabolic fent una aproximaci? de la derivada
%     per al primer punt. Dibuixa l'aproximaci? obtinguda.
% (4) Per a cada un dels Splines dibuixa (i) l'aproximaci? amb les dades
%     donades i (ii) modificant el valor del 3er punt de 1 a 2. Observa
%     on i quant afecta la modificaci? del valor en cada cas.
% (5) Dibuixa la base de cada un dels Splines. Es una base local? Explica
%     aix? el comportament dels Spline a l'apartat anterior?
%     (Pot ser util la funcio subplot)

%Dades
x = [0,1,2]; y = [-1,0,1];
% x = [0,1,3,4,5,7]; y = [1,1.25,2,0.5,0,0.4];

%Spline C1 cubic amb aproximacio de les derivades
i = 2:length(x)-1;
dS = [0,2,-2];
[xS1,yS1,coeficients]=dibuixaSplineCubic(x,y,dS,[]);
coeficients
figure(1)
axis ([0,7,0,2.5])
plot(xS1,yS1,'r-',x,y,'ko','LineWidth',2)
legend('C1 cubic')

% %Spline natural
d2S = [0,2,-2];
[xS2,yS2,coeficients]=dibuixaSplineCubic(x,y,dS,[]);
coeficients
figure(1)
plot(xS1,yS1,'r-',xS2,yS2,'b-',x,y,'ko','LineWidth',2)
legend('C1 cubic','Natural')

% %Spline parabolic C1 (recurrent)
% [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y);
% coeficients
% figure(1)
% plot(xS1,yS1,'r-',xS2,yS2,'b-',xS3,yS3,'g-',x,y,'ko','LineWidth',2)
% legend('C1 cubic','Natural','parabolic')
% % 
% %Base spline cubic C1
% figure(2)
% title("base spline cubic C1")
% for i = 1 : length(x)
%     %Base Phi i
%     
%     y  = zeros(1,length(x) );
%     y(i) = 1;
% 
%     dS = zeros(1,length(x) );
%     
%     [xB,yB,~]=dibuixaSplineCubic(x,y,dS,[]);
%     subplot(length(x),2, 2*i -1);
%     plot(xB,yB)
%     title(['phi ', num2str(i)])
%     grid on;
%     
%     %Base Phi mayuscula i
%     y  = zeros(1,length(x) );
%     dS = zeros(1,length(x) );
%     dS(i) = 1;
%     
%     [xB,yB,~]=dibuixaSplineCubic(x,y,dS,[]);
%     subplot(length(x),2, 2*i);
%     plot(xB,yB)
%     title(['Phi ', num2str(i)])
%     grid on;
% end
% 
% %Base spline cubic C2
% figure(3)
% title("base spline cubic C2")
% for i = 1 : length(x)
%     %Base Phi i
%     y  = zeros(1,length(x) );
%     y(i) = 1;
%     d2S = calculaCurvaturesSplineNatural(x,y);
%     
%     [xB,yB,~]=dibuixaSplineCubic(x,y,[],d2S);
%     subplot(length(x),1, i);
%     plot(xB,yB)
%     title(['phi ', num2str(i)])
%     grid on;
% end
% 
% %Base spline parabolic C1
% figure(4)
% title("base parabolic C1")
% for i = 1 : length(x)
%     
%     %Base Phi i
%     y  = zeros(1,length(x) );
%     y(i) = 1;
%     
%     [xB,yB,~]=dibuixaSplineC1Parabolic(x,y);
%     subplot(length(x),1, i);
%     plot(xB,yB)
%     title( ['phi ', num2str(i)] )
%     grid on;
% end
% 
