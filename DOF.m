function D=DOF(aperture,focal,distance,blur)

%blur=1.22.*lambda./aperture;
F=aperture./distance;
D=2.*(F.*blur.*distance.*(distance-focal).*(focal.^2))./((focal.^4)-(F.^2.*blur.^2.*distance.^2));
