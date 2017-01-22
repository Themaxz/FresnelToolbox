L=Makelens(0.4,0.01,0.004,2999,633);v
w=0.01;
z1=0.8;
z2=0.8;
f=0.4;
P=Makepupil(1e-2,2999,1e-4);
P.field=zeros(3000);
P.field(1200:3000,:)=1;
M=3000;
x=[(-dxi.*(M-1))./2:dxi:(dxi.*(M-1))./2];
p0=P.field(1500,:);
for n=1:500
    if mod(n,10)==1||(n==1)
        for k=1:n

            %creates random phase pattern
            Y=randphase_sources(coherence_degree,m-1);

            %creates random phase optical field

            buffer=P.field.*Y;
            Pbuffer.field=buffer;

            %propagates the optical field
            F=AngularBL(Pbuffer,z1,lambda);%,coherence_degree);
            %F.field=F.field./max(max(F.field));
            %lens 
            F1=throughlens(F,L,lambda);

            %second propagation
            F2_=AngularBL(F1,z2,lambda);

            image=image+abs(F2_.field).^2;
            p1=zeros(1,M);
                for i=1000:2000

                    buffer=image(i,:);
                    p1=p1+buffer;

                end   
                profiles(:,n)=p1;
            save(strcat(date,'EDGE',num2str(n)));
            n
        end
    end
end