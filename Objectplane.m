function [XI,ETA,dxi]=Objectplane(dim,pixel)
 
%[xi,eta,dxi]=Objectplane(dim,pixel);
%Creates an object plane. dxi=pixel dimension

if size(pixel)==1
    dim=dim(1);
    xi=linspace(-dim./2,dim/2,pixel);
    [XI,ETA]=meshgrid(xi);
    dxi=dim./(pixel);

else
    
    xi=linspace(-dim(2)./2,dim(2)/2,pixel(2));
    eta=linspace(-dim(1)./2,dim(1)/2,pixel(1));
    [XI,ETA]=meshgrid(xi,eta);
    dxi=dim(1)/pixel(1);
end

