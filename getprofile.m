function p=getprofile(U,minimo,massimo,direction,coordinate)
%p=getprofile(U,min,max,direction,coordinate)
if ~exist ('direction') %#ok<EXIST>
    direction='x';
end
if ~exist ('coordinate') %#ok<EXIST>
    coordinate=floor(max(size(U.field))./2);
end
if ~exist ('minimo')  %#ok<BDSCA>
     
     minimo=1;
end
 if ~exist('massimo')
     massimo=max(size(U.field));
 end
%s=round(max(size(U.field)));
l1=minimo;
l2=massimo;
switch direction
    case 'x'
        p=abs(U.field(l1:l2,coordinate));
        
%         %m=max(abs(p));
%         p=p-min(p(:));
%         p=p./max(p(:));
        
    case 'y'
        p=abs(U.field(coordinate,l1:l2));
%         p=p-min(p);
%         p=p./max(p);
    otherwise
        p=-1;
        return
end

       
        