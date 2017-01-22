%create field
P1=Makepupil(dimention,resolution,radius);
P2=Makepupil(dimention,resolution,radius);
%create lens1
L1=Makelens(focous1,dimention,aperture,resolution,lambda);
%create lens2
L2=Makelens(focous2,dimention,aperture,resolution,lambda);



%Preallocate memory
m=max(size(P1.field));
FIELD=zeros(m);
buffer1=zeros(m);
buffer2=zeros(m);
Pbuffer1=P;
Pbuffer2=P;

%incoherent propagation

for k=1:n
   
    %creates random phase pattern
    Y=randphase2(coherence_degree,m); %coherence degree is in reality incoherence degree from 0.01 to 0.1 is a reasonable number
    %high incoherece might give aliasing problems
    
    %creates random phase optical field
    
    buffer1=P1.field.*Y;
    buffer2=P2.field.*Y;
    %both fields have the same phase
    Pbuffer1.field=buffer1;
    Pbuffer2.field=buffer2;
    %adding tilt
    %Pbuffer2.field=Pbuffer.2.field.*Zernike;
    %propagates the optical field 1 with angular spectrum method
    F=PropagateAngr(Pbuffer1,z1,lambda);%,coherence_degree);
    
    %lens 
    F1=throughlens(F,L1,lambda);
    
    %second propagation
    F2=PropagateAngr(F1,z2,lambda);
    
    %second lens
    F2=throughlens(F2,L2,lambda);
    
    %Propagation microarray CCD
    Pbuffer1=PropagateAngr(F2,z3,lambda);
    
    %propagates the optical field 2 with angular spectrum method
    
    
    F=PropagateAngr(Pbuffer2,z1,lambda);%,coherence_degree);
    
    %lens 
    F1=throughlens(F,L1,lambda);
    
    %second propagation
    F2=PropagateAngr(F1,z2,lambda);
    
    %second lens
    F2=throughlens(F2,L2,lambda);
    
    %Propagation microarray CCD
    Pbuffer2=PropagateAngr(F2,z3,lambda);
    
    interference=Pbuffer1.field+Pbuffer2.field;
    
    %add the optical field to the one previosly calculated
    FIELD=FIELD+abs(interference).^2;
    
    %timer (just to monitor long simulations
    
    k
    
end