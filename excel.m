clear all
close all
clc
NL=[1 -1;1 1; 2 -2; 2 0; 2 2; 3 -3; 3 -1; 3 1; 3 3];

index=3;
cd('C:\Users\Massimo\Documents\MATLAB\ECBO\plane wave');
% rad=1;
% az=-1;
for index1=6:max(size(NL))
        
     nl=NL(index1,:);
   rad=nl(1);
   az=nl(2);
   display(i);
kappa=1;
for i=-index:index
    load(strcat('PW_ab',num2str(rad),num2str(az),'_',num2str(index),'e-07.mat'));
    load phaseWF0.mat
    correlation_simple3
    PIX_X(:,:,kappa)=pix_x;
    PIX_Y(:,:,kappa)=pix_y;
    kappa=kappa+1;
    display('iteration: ');
    display(kappa);
end
display(strcat('Saving file: shift',num2str(rad),num2str(az),'.mat','...'));
save(strcat('shift',num2str(rad),num2str(az),'.mat'),'PIX_Y','PIX_X','dx');
display('saved! =)')
end
    