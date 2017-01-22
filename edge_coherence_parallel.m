function F3=edge_coherence_parallel(P,L,FL,z1,z2,lambda,iterations,coherence_degree)
%U=Incoherent(P,zeta,lambdan,coherence_degree,timer)
%propagates the field distribution P of a distace z1, then it passes
%throught a lens L and then it propagates again of a distance z2
%Fresnel propagation of inchoerent light
%Propagate(P,zeta,lambda,Mmax,pre_pad,loop_on,pad_off)
if ~exist('t')
    t='n';
end
tic
P
%preallocate Memory
N=size(P.field);
FIELD=zeros(N);
buffer=zeros(N);

% image=FIELD;
% F3.field=FIELD;
% F3.a=a;
% F3.b=b;
% F3.m=b./a;
% F3.NAmicro=M.lens_diameter./b;
% F3.fnumberm=1./F3.NAmicro;
% F3.cutoffm=1./(lambda.*1e-9.*F3.fnumberm);
% F3.z2=z2;
% F3.NAlens=2.*L.radius./z2;
% F3.fnumberL=1./F3.NAlens;
% F3.cutoffL=1./(lambda.*1e-9.*F3.fnumberL);
% F3.frequency=frequency;
% if (ischar(frequency))
%     freq=frequency;
%     F3.frequency=0;
% end
if size(N)>=1 %to run simulation on a square sensor
    N=N(1);
end
%log file generator
% if (ischar(frequency))
%     freq=frequency;
%     F3.frequency=0;
% else
%     freq=num2str(frequency);
% end
% file=[a,b,F3.m,F3.fnumberm,F3.cutoffm,z2,F3.fnumberL,F3.cutoffL,F3.frequency] ;
% date=datestr(clock,29);
% cell=['a              ';'b              ';'m              ';'Fmicro         ';'Cutoff micro   ';'z              ';'Flens          ';'cutoff lens    ';'sine frequency '];
% fid=fopen(strcat(date,freq,'SIN.txt'),'w');
% fprintf(fid,'\nSimulation parameters\n');
% for i=1:max(size(file))
%     
%     for j=1:max(size(cell))
%         fprintf(fid,'%s',cell(i,j));
%     end
% 
%     fprintf(fid,'%f\n',file(i));
% end
% fclose(fid);
%incoherent propagation
nn=iterations;
Pbuffer{nn} = [];
tempF{nn} = [];

if(matlabpool('size') == 0)
    matlabpool open 2
end
parfor k=1:iterations
   
    %creates random phase pattern
   
   Y=randphase_sources(coherence_degree,N);
    
    %creates random phase optical field
    
    buffer=P.field.*Y;
    Pbuffer{k} = P;
    Pbuffer{k}.field=buffer.*FL.lens;
    %propagates the optical field
     F=AngularBL(Pbuffer{k},z1,lambda);%,coherence_degree);
    %F.field=F.field./max(max(F.field));
    %lens 
    F1=throughlens(F,L,lambda);
    
    %second propagation
    %F2_=AngularBL(F1,z2,lambda);
    tempF{k} = AngularBL(F1,z2,lambda);
   % FIELD=FIELD+abs(F2_.field).^2;
    
%     F2=AngularBL(F2_,a,lambda);
%     
%     %microlens array
%     F2.field=F2.field.*M.field;
%     
%     %Propagation microarray CCD
%     F3=AngularBL(F2,b,lambda);
%     
%     %add the optical field to the one previosly calculated
%     FIELD=FIELD+abs(F3.field).^2;
%     field1=FIELD;
%     
    %timer (just to monitor long simulations
     display(strcat('iteration: ',num2str(k)));
%     if mod(k,10)==0
%         save(strcat(date,'SINo.mat'));
% %         save('IMAGEsin.mat');
    
end

FIELD = zeros(N);
for ii = 1:nn
    FIELD=FIELD+abs(tempF{ii}.field).^2;
end
F3=FIELD;
 
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