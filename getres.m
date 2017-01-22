function M=getres(P,z,lambda)
lambda=lambda.*1e-9;
M=(P.DXI.^2)/(lambda.*z);