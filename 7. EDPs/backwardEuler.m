function U = backwardEuler(x,Ax,At, nu ,nOfSteps,nOfStepsPlot,ua,ub,f)

% Un = Unm1 + rA*Un + rFn =>  Un = inv([I-rA]) * Unm1 + rFn

%Initialization
s = size(f) - [2,0]; %cal retallar les puntes
Un = zeros(s);
Unm1 = f(2:end-1); %solution at time n-1 (n minus 1)
U = f;

r = nu*At/(Ax)^2; 

subdiags = ones(s - [1,0]);
maindiag = -2*ones(s);
A = diag(maindiag) + diag(subdiags, -1) + diag(subdiags,1);

F = zeros(s(1),nOfSteps + 1); F(1,:) = ua; F(end,:) = ub;
inversa = inv(eye(s(1)) - r*A); 
%Precalculo la inversa per no haver de fer calculs  innecessaris
%(QUE HO HE MIRAT I LA MATRIU ES INVERTIBLE PER TOT r, VALE?!? ) 

%Loop in time steps
for n=1:nOfSteps
    Un = inversa*(Unm1 + r*F(:,n));
    if ( mod(n,nOfStepsPlot)==0 | n==nOfSteps )
        U = [U ,[ua(n);Un;ub(n)]];
    end
    Unm1 = Un; %next step
end