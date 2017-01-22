function F=Incoherent(P,zeta,lambda,n,coherence_degree,t)
%U=Incoherent(P,zeta,lambdan,coherence_degree,timer)

%Fresnel propagation of inchoerent light
if ~exist('t')
    t='n'
end
tic
pad=getpad(P,lambda,zeta);
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
    Y=randphase(coherence_degree,M);
   %creates random phas optical field
    buffer=P.field.*Y;
    Pbuffer.field=buffer;
    %propagates the optical field
    F=Fresnelr(Pbuffer,zeta,lambda);
    %add the optical field to the one previosly calculated
    FIELD=FIELD+abs(F.field).^2;
    %timer (just to monitor long simulations
    if t=='y'
        k
    end
end

S=size(P.field);
M=max(S);
dF=1/(M.*P.dxi); 
S1=size(F.field);
J=dF.*(S1(1)-1);
f=(-J./2):dF:(J./2);
F.field=FIELD;
%if the field has been propagating after a lens calculate the normalized
%optical frequency
if P.lens_on==1;
    F.z=P.z./zeta;
end
    
if control==0
    F.ratio=P.dxi./F.dxi;
end
figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(F.xi,F.xi,F.field), axis square;

toc