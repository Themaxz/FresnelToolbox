function SUB=select_sub(raw,x,y,pixel)
if x==0
    x=1;
end
if y==0
    y=1;
end
if x==1
    if y==1
    
        SUB = raw((1):(pixel*(x)),(1:(pixel*(y))));
    
    else
        SUB = raw((1):(pixel*(x)),(pixel*(y-1)):(pixel*(y)));

    end  

elseif y==1


%     if x==1
%         SUB = raw((1):(pixel*(x)),(1):(pixel*(y)));
%     else
        SUB = raw((pixel.*(x-1)):(pixel*(x)),(1):(pixel*(y)));  
    end
if x~=1&&y~=1

    SUB = raw((pixel*(x-1)):(pixel*(x)),(pixel*(y-1)):(pixel*(y)));
end