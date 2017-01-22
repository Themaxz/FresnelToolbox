function pad=Padback(P1,P2,lambda,zeta)
%pad=Padback(P1,P2,lambda,zeta)
x=1:10000;
s=max(size(P1));

p=1./lambda.*zeta.*(P2.dF.^2);
pad=p-s;

