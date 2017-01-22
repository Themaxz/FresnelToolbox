function parameters=designlens(INPUT)
%INPUT is a struct with the following fields
%FOV
%res
%focal
% f_num
% w
%lambda
%dx
lambda=INPUT.lambda;
if size(INPUT.w)==1
    width=INPUT.w;
    lenght=width;
    
else
width=INPUT.w(1);
lenght=INPUT.w(2);

end
if size(INPUT.res)~=1
    res=min(INPUT.res);
else 
    res=INPUT.res;
end
if isfield(INPUT, 'dx')==0 %#ok<EXIST>
   dx=width./res; 
else
    dx=INPUT.dx;
end
if isfield(INPUT, 'focal')==0 %#ok<EXIST>
f_min=4.*pi.*width.*dx./lambda;

parameters.focal=f_min;
end
if isfield(INPUT, 'f_num')==0
parameters.w_max=lambda.*INPUT.focal./(4.*pi.*dx);
end
parameters.dx=dx;

    
    
