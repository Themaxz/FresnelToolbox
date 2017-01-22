function R=makerct(dim,pixel,size,offset)
%creates a rectangle of ones into a field of zeros 
%offset is a vector with offset in x and y respect the center of the figure
%pixel = resolution of the field; dim = dimention of the field(in meters);
%size = size of a side of the rectangle; offset = position of the center of
%the rectangle in the field
[XI,ETA,dx]=Objectplane(dim,pixel);
buffer=zeros(pixel);
if ~exist('offset')
     lim=size./dx;
    buffer(round(end./2)-(round(lim(1)./2)):round(end./2)+(round(lim(1)./2)),round(end./2)-(round(lim(2)./2)):round(end./2)+(round(lim(2)./2)))=1;
    R=buffer;
else   
    lim=size./dx;
    os=offset./dx;
    buffer((round(end./2)-os(1))-(round(lim(1)./2)):round((end./2)-os(1))+(round(lim(1)./2)),round((end./2)-os(2))-(round(lim(2)./2)):round((end./2)-os(2))+(round(lim(2)./2)))=1;
    R=buffer;
  
   
end
