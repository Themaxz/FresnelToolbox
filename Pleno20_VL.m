function [raw,IMG]=Pleno20_VL(U,L,M,d1,d2,a,b,lambda,virtual,iterations)
%propagates the field U into a Plenoptic 2.0 system. L is the main lens, d1
%and d2 are the distance of object and image, M is the microarray, a and b
%are the distance from the microarray of the main lens image and of the
%sensor. 

RAW=zeros(size(U.field));
IMG=zeros(size(U.field));
%coherent propagation
if iterations==0
    
    
    U1=AngularBL(U,d1,lambda); %first propagation
    if virtual
            U1=virtual_lens(U1,L.diameter);
        else
            U1.field=U1.field.*L.lens; %passage through the lens
        end
    
    U2=AngularBL(U1,d2,lambda); %second propagation
    IMG=abs(U2.field.^2);
    U3=AngularBL(U2,a,lambda); %third propagation
    U3.field=U3.field.*M.field; %passage through microarray
    U4=AngularBL(U3,b,lambda); %last propagation
    raw=abs(U4.field.^2); %raw data
    
    
else
    
    for i=1:iterations
        
        Y=randphase_sources3(500,(max(size(U.field)))-1); %random phase
        U.field=U.field.*Y; %random phase
        
        U1=AngularBL(U,d1,lambda); %first propagation
        if virtual
            U1=virtual_lens(U1,L);
        else
            U1.field=U1.field.*L.field; %passage through the lens
        end
        U2=AngularBL(U1,d2,lambda); %second propagation
        
        IMG=IMG+abs(U2.field.^2);
        U3=AngularBL(U2,a,lambda); %third propagation
        U3.field=U3.field.*M.field; %passage through microarray
        U4=AngularBL(U3,b,lambda); %last propagation
        
        RAW=RAW+abs(U4.field.^2); %raw data
        display(strcat('iteration: ',num2str(i)));
    end
    raw=RAW;
end
    
    
    
    