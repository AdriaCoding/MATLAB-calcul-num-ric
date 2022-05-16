function U = parabolicEuler(x,Ax,At, nu ,nOfSteps,nOfStepsPlot,ua,ub,f)

%Initialization
Un = zeros(size(f));
Unm1 = f; %solution at time n-1 (n minus 1)
U = f;

r = nu*At/(Ax)^2  % la sol es estable si r <= 1/2 (teoria)
                  % m creix => r creix (quadraticament)
                  % noftimesteps creix => r decreix
                  % T creix => r creix

%Loop in time steps
for n=1:nOfSteps
    Un(1)=ua(n+1); Un(end)=ub(n+1); % boundary conditions  
    %interior nodes
    Un(2:end-1)=r*Unm1(3:end)+(1-2*r)*Unm1(2:end-1)+r*Unm1(1:end-2);
    if ( mod(n,nOfStepsPlot)==0 | n==nOfSteps )
        U = [U Un];
    end
    Unm1 = Un; %next step
end