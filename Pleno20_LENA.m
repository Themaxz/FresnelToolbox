function [F3,image]=Pleno20_LENA(P,L,M,z1,z2,a,b,lambda,n,coherence_degree)
%U=Incoherent(P,zeta,lambdan,coherence_degree,timer)
%propagates the field distribution P of a distace z1, then it passes
%throught a lens L and then it propagates again of a distance z2
%Fresnel propagation of inchoerent light
%Propagate(P,zeta,lambda,Mmax,pre_pad,loop_on,pad_off)

tic
%preallocate Memory
m=max(size(P.field));
FIELD=zeros(m);
buffer=zeros(m);
Pbuffer=P;
image=FIELD;
F3.field=FIELD;
F3.a=a;
F3.b=b;
F3.m=b./a;
F3.NAmicro=M.lens_diameter./b;
F3.fnumberm=1./F3.NAmicro;
F3.cutoffm=1./(lambda.*1e-9.*F3.fnumberm);
F3.z2=z2;
F3.NAlens=2.*L.radius./z2;
F3.fnumberL=1./F3.NAlens;
F3.cutoffL=1./(lambda.*1e-9.*F3.fnumberL);
% F3.frequency=frequency;
file=[a,b,F3.m,F3.fnumberm,F3.cutoffm,z2,F3.fnumberL,F3.cutoffL] ;
%log file generator
 freq=num2str(F3.m);
date=datestr(clock,29);
cell=['a              ';'b              ';'m              ';'Fmicro         ';'Cutoff micro   ';'z              ';'Flens          ';'cutoff lens    '];
fid=fopen(strcat(date,freq,'LENA.txt'),'w');
fprintf(fid,'\nSimulation parameters\n');
for i=1:max(size(file))
    
    for j=1:max(size(cell))
        fprintf(fid,'%s',cell(i,j));
    end

    fprintf(fid,'%f\n',file(i));
end
fclose(fid);
%incoherent propagation
for k=1:n
   
    %creates random phase pattern
    Y=randphase_sources(coherence_degree,m-1);
    
    %creates random phase optical field
    
    buffer=P.field.*Y;
    Pbuffer.field=buffer;
    display(strcat('iteration: ',num2str(k)));
    %propagates the optical field
    F=AngularBL(Pbuffer,z1,lambda);%,coherence_degree);
    %F.field=F.field./max(max(F.field));
    %lens 
    F1=throughlens(F,L,lambda);
    
    %second propagation
    F2_=AngularBL(F1,z2,lambda);
    
    image=image+abs(F2_.field).^2;
    
    F2=AngularBL(F2_,a,lambda);
    
    %microlens array
    F2.field=F2.field.*M.field;
    
    %Propagation microarray CCD
    F3=AngularBL(F2,b,lambda);
    
    %add the optical field to the one previosly calculated
    FIELD=FIELD+abs(F3.field).^2;
    
    %timer (just to monitor long simulations
%     if t=='y'
%         k
%     end
    if mod(k,10)==0
        save(strcat(date,freq,'LENA.mat'));
%         save('IMAGEsin.mat');
    end
end


 F3.field=FIELD;
% F3.a=a;
% F3.b=b;
% F3.m=b./a;
% F3.NAmicro=M.lensdiameter./b;
% F3.fnumberm=1./F3.NAmicro;
% F3.cutoffm=1./(lambda.*1e-9./F3.fnumberm);
% F3.z2=z2;
% F3.NAlens=2.*L.radius./z2;
% F3.fnumberL=1./F3.NAlens;
% F3.cutoffL=1./(lambda.*1e-9./F3.fnumberm);
% 
% figure, subplot(1,2,1), imagesc(P.xi,P.xi,abs(P.field)), axis square, subplot(1,2,2),imagesc(F3.xi,F3.xi,abs(F3.field)), axis square;

toc