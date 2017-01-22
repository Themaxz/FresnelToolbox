function U=IncoherentLens(P,L,z1,z2,lambda,n,coherence_degree,t)
%U=Incoherent(P,zeta,lambdan,coherence_degree,timer)
%propagates the field distribution P of a distace z1, then it passes
%throught a lens L and then it propagates again of a distance z2
%Fresnel propagation of inchoerent light
if ~exist('t')
    t='n'
end
tic
pad=getpad(P,lambda,z1);
control=0;
if pad<=1000 && pad>=0
    
    P=Padding(P,round(pad));
    control=1;
end
M=max(size(P.field))
%lambda=lambda.*1e-9;
%field=zeros(M,M,n); 
FIELD=zeros(M);
buffer=zeros(M);
Pbuffer=P;
for k=1:n
   
    %creates random phase pattern
    Y=randphase2(coherence_degree,M);
    %creates random phas optical field
    buffer=P.field.*Y;
    Pbuffer.field=buffer;
    %propagates the optical field
    zi=getzeta(P,lambda);
    step=z1./zi;
    step=round(step);
    
    F=Fresnelr(Pbuffer,zi,lambda);
    for h=1:step-1
        F=Fresnelr(F,zi,lambda);
    end
    %lens
    
    %keyboard
   
    F1=throughlens(F,L,lambda);
    %second propagation
    zi=getzeta(P,lambda);
    step=z1./zi;
    step=round(step);
    
    F2=Fresnelr(F1,z2,lambda);
    
    for h=1:step-1
        F2=Fresnelr(F2,zi,lambda);
    end
    
    %add the optical field to the one previosly calculated
    FIELD=FIELD+abs(F2.field).^2;
    F2.dxi
    %timer (just to monitor long simulations
    if t=='y'
        k
    end
end
% z=z1+z2;
% S=size(P.field);
% M=max(S);
% dF=1/(M.*P.dxi); 
% S1=size(F.field);
% J=dF.*(S1(1)-1);
% f=(-J./2):dF:(J./2);
U.field=FIELD;
U.f=F2.f;
U.fx=F2.fx;
U.fy=F2.fy;
U.F=F2.F;
U.dF=F2.dF;
U.dxi=F2.dxi;
U.XI=F2.XI;
U.ETA=F2.ETA;
U.DXI=F2.DXI;
U.xi=F2.xi;
%if the field has been propagating after a lens calculate the normalized
%optical frequency
% if P.lens_on==1;
%     F.z=P.z./zeta;
% end
%DX=F.*lambda.*z;
% dx=dF.*lambda.*z;    
% U.dx=dx;
if control==0
    U.ratio=P.dxi./U.dxi;
end
figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(U.xi,U.xi,abs(F.field)), axis square;

toc