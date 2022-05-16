function distorsioMalla = calculaDistorsioMalla(X,T)

Nt = size(T,1);      %Nombre de triangles
nu = zeros(Nt,1);     %vector amb la distorsió de cada triangle

for e = 1:Nt
    A = [1  -sqrt(3)/3
         0   2*sqrt(3)/3];
    Xe = X(T(e,:),:);
    Dphi = [Xe(2,:)-Xe(1,:);  Xe(3,:)-Xe(1,:)]'*A;
    nu(e) = (norm(Dphi, 'fro')^2)/(2*abs(det(Dphi)));
end

distorsioMalla = norm(nu,2);
        

% Completar el codi per calcular la distorsi? de la malla amb nodes X i
% connectivitats T
% ...
% ...
% ...

