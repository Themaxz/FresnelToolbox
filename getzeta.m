function z=getzeta(P,lambda)
M=max(size(P.field));
W=max(max(P.DXI));
lambda=lambda.*1e-9;
z=(W.^2)/(lambda.*M);