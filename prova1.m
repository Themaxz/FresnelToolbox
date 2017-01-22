FIELD1=zeros(2001);
s=max(size(P.field));
for k=1:50
      
    %creates random phase pattern
    Y=randphase_sources3(19,2001);
    Y=Y(1:2001,1:2001);
    %creates random phas optical field
    P.field=P.field.*Y;
%     Pbuffer.field=buffer;
    %propagates the optical field
    F1=PropagateAngr2(P,8e-2,633);

    
    %add the optical field to the one previosly calculated
    FIELD1=FIELD1+abs(F1.field).^2;
    %timer (just to monitor long simulations
    k
end
