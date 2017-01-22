function F2=IncoherentLens(P,L,z1,z2,lambda,n,coherence_degree,t)
%U=Incoherent(P,zeta,lambdan,coherence_degree,timer)
%propagates the field distribution P of a distace z1, then it passes
%throught a lens L and then it propagates again of a distance z2
%Fresnel propagation of inchoerent light
if ~exist('t')
    t='n'
end
tic
% pad=getpad(P,lambda,z1);
% control=0;
% 
% if pad<=1000 && pad>=0
%     
%     P=Padding(P,round(pad));
%     control=1;
% end

M=max(size(P.field))
FIELD=zeros(M);
buffer=zeros(M);
Pbuffer=P;
for k=1:n
   
    %creates random phase pattern
    Y=randphase_sources(coherence_degree,M-1);
    
    %creates random phas optical field
    buffer=P.field.*Y;
    Pbuffer.field=buffer;
    
    %propagates the optical field
    F=PropagateAng2(Pbuffer,z1,lambda);
    
    
    %lens
     
    F1=throughlens(F,L,lambda);
    
    %second propagation
    F2=PropagateAng2(F1,z2,lambda);
    
    %add the optical field to the one previosly calculated
    FIELD=FIELD+abs(F2.field).^2;
    
    
    %timer (just to monitor long simulations
    if t=='y'
        k
    end
    
end

F2.field=FIELD;
% % if control==0
% %     F2.ratio=P.dxi./F2.dxi;
% % end
% figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(F2.xi,F2.xi,abs(F2.field)), axis square;

toc