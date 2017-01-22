% prompt='iterations: ';
% MAX=input(prompt);
coherence_degree=500;
L=Makelens(0.4,0.01,0.004,2999,633);
w=0.01;
z1=0.8;
z2=0.8;
f=0.4;
P=Makepupil(1e-2,2999,1e-4);
P.field=zeros(3000);
P.field(1200:3000,:)=1;
M=3000;
x=[(-P.dxi.*(M-1))./2:P.dxi:(P.dxi.*(M-1))./2];
p0=P.field(1500,:);
m=3000;
lambda=633;
Pbuffer=P;
image=zeros(3000);
%move data to the GPU
P.field=GPUarray(P.field);
L.lens=GPUarray(L.lens);

% parfor n=1:MAX
%     if mod(n,10)==1||(n==1)
%         prompt=strcat('n= ',num2str(n)); 
tic       
    for k=1:10

            %creates random phase pattern
            Y=randphase_sources(coherence_degree,m-1);
            Y=GPUarray(Y);
            %creates random phase optical field

            Pbuffer=P;
            Pbuffer.field=P.field*Y;

            %propagates the optical field
            F=AngularBL(Pbuffer,z1,lambda);%,coherence_degree);
            %F.field=F.field./max(max(F.field));
            %lens 
            F1=throughlens(F,L,lambda);

            %second propagation
            F2_=AngularBL(F1,z2,lambda);

            image=image+abs(F2_.field).^2;
            p1=zeros(1,M);
%                 for i=1000:2000
% 
%                     buffer=image(i,:);
%                     p1=p1+buffer;
% 
%                 end   
%                 profiles(:,n)=p1;
                
%             save(strcat(date,'EDGE',num2str(n)));
%             prompt=strcat('iteration=',num2str(k)');
    end
image-gather(image);    
    
        
   toc