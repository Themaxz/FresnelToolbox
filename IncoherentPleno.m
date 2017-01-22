function F3=IncoherentPleno(P,L,M,z1,z2,z3,lambda,n,coherence_degree,t)
%U=Incoherent(P,zeta,lambdan,coherence_degree,timer)
%propagates the field distribution P of a distace z1, then it passes
%throught a lens L and then it propagates again of a distance z2
%Fresnel propagation of inchoerent light
%Propagate(P,zeta,lambda,Mmax,pre_pad,loop_on,pad_off)
if ~exist('t')
    t='n'
end
tic
%preallocate Memory
m=max(size(P.field));
FIELD=zeros(m);
buffer=zeros(m);
Pbuffer=P;

%incoherent propagation

for k=1:n
   
    %creates random phase pattern
    Y=randphase2(coherence_degree,m);
    
    %creates random phase optical field
    
    buffer=P.field.*Y;
    Pbuffer.field=buffer;
    
    %propagates the optical field
    F=Propagater(Pbuffer,z1,lambda);%,coherence_degree);
    %F.field=F.field./max(max(F.field));
    %lens 
    F1=throughlens(F,L,lambda);
    
    %second propagation
    F2=Propagater(F1,z2,lambda);
    
    %microlens array
    F2.field=F2.field.*M.field;
    
    %Propagation microarray CCD
    F3=Propagater(F2,z3,lambda);
    
    %add the optical field to the one previosly calculated
    FIELD=FIELD+abs(F3.field).^2;
    
    %timer (just to monitor long simulations
    if t=='y'
        k
    end
end


F3.field=FIELD;


figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(F3.xi,F3.xi,abs(F3.field)), axis square;

toc