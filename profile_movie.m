function M=profile_movie(p,frames);
for n=1:frames

plot(p(:,n));

%axis equal;

%axis([0,max(x),0,max(y)+10]);

%xlabel('x (ft)');
%
%          ylabel('y (ft)');

 %         title('Projectile Trajectory');

          M(n)=getframe;

end
