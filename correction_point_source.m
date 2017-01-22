close all
% clear all
%global variables
%coerence
% coherence_degree=500;
% iterations=250; %number of iterations
m = .5;
pinhole_size=10e-6;
%SENSOR
% res=[2748 3840]; %sensor resolution
res=[2000 2000];
dx=1.67e-6; %pixel size
w=res.*dx;
% w=[4.589 6.413].*1e-3; %sensor size
% res=[2748 2748]; %sensor resolution
% dx=1.67e-6; %pixel size
% w=[4.589 4.589].*1e-3; %sensor size
res1=4500;

%MAIN LENS
f=60e-3; %main lens focal lenght
virtual=0;

%MLA
MLA_w=[10 10].*1e-3;
f_micro=5.2e-3; %focal lenght
pitch=150e-6; %pitch
% m=.5; %magnification
lambda=633; %wavelenght in nanometers

%define object plane
w = [10e-3 10e-3];



f = 158e-3;
z = 318e-3;
w = [10e-3 10e-3];
z1 = z;
z2 = z1;
radius = 2.5e-3;
P=Makepupil(w,res,pinhole_size);

L=Makelens(f,w,radius,res,lambda);
radius_pix=round(radius./dx);
i = 1;
%%
%band limited AS
F=AngularBL(P,z1,lambda);%,coherence_degree);
    %F.field=F.field./max(max(F.field));
    %lens 
    F1=throughlens(F,L,lambda);
    
    %second propagation
    F2_=AngularBL_nofilter(F1,z2,lambda);
    
    image{i}=abs(F2_.field).^2;
    

   
    i = i+1;
    %% corrected
    %band limited AS
F=AngularBL_test(P,z1,lambda);%,coherence_degree);
    %F.field=F.field./max(max(F.field));
    %lens 
    F1=throughlens(F,L,lambda);
    
    %second propagation
    F2_=AngularBL_nofilter(F1,z2,lambda);
    
    image{i}= abs(F2_.field).^2;
    

    i = i+1;
    %%
    %multi
        %band limited AS
F=Propagate(P,z1,lambda);%,coherence_degree);
    %F.field=F.field./max(max(F.field));
    %lens 
    F1=throughlens(F,L,lambda);
    
    %second propagation
    F2_=Propagate(F1,z2,lambda);
    
     image{i}= abs(F2_.field).^2;
    i = i+1;
    %%
        %band limited AS
F=AngularBL_nofilter(P,z1,lambda);%,coherence_degree);
    %F.field=F.field./max(max(F.field));
    %lens 
    F1=throughlens(F,L,lambda);
    
    %second propagation
    F2_=AngularBL_nofilter(F1,z2,lambda);
    
     image{i}= abs(F2_.field).^2;
     %%
     for i = 1:4
         D2{i} = image{i}(:,end/2);
    
         figure, plot(D2{i});
     end
  