alpha=0.84;
for x=1:100
    for y=1:100
        for u=1:10
            for v=1:10
                L(x,y,u,v)=L((x./alpha)+u.*(1-1./alpha),(y./alpha)+v.*(1-1./alpha),u,v);
            end 
        end
    end
end
