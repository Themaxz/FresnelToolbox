function E=Epipolar(L,spatial,direction,coordinate)

%E=Epipolar(L,spatial,direction,coordinate)
%creates the epipolar image from Light Field L
%an epipola image is a 2D slice of the light field where 
%a spatial coordinate and a directional coordinate are fixed
%EG t and v fixet while s and u vary
%the depth of the object can be estimated from the slope of the lines
%in the epipolar images
%coordinate is a char 'su' takes epipolar image with s and u fixed,
%while 'tv' takes the epipolar image with t and v fixed definel=d by
%spatial al direction

if coordinate=='su'
    e=L(spatial,:,direction,:);
end

if coordinate=='tv'
    e=L(:,spatial,:,direction);

end
E=squeeze(e);
    
      