function F=Incoherent1(P,L,zeta1,zeta2,lambda,n,coherence_degree,t)
%U=Incoherent(P,zeta,lambdan,coherence_degree,timer)

%Fresnel propagation of inchoerent light
if ~exist('t')
    t='n'
end
tic

M=max(size(P.field))
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
    F1=Propagater(Pbuffer,zeta1,lambda);

    F2=throughlens(F1,L,lambda);
    F3=Propagater(F2,zeta2,lambda);
    
    %add the optical field to the one previosly calculated
    FIELD=FIELD+abs(F3.field).^2;
    %timer (just to monitor long simulations
    if t=='y'
        k
    end
end

S=size(P.field);
M=max(S);
dF=1/(M.*P.dxi); 
S1=size(F3.field);
J=dF.*(S1(1)-1);
f=(-J./2):dF:(J./2);
F3.field=FIELD;
%if the field has been propagating after a lens calculate the normalized
%optical frequency
% if P.lens_on==1;
%     F3.z=P.z./zeta;
% end
    

F3.ratio=P.dxi./F3.dxi;
F=F3;

figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(F3.xi,F3.xi,F.field), axis square;

toc