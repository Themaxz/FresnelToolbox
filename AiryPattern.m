function [n,p]=AiryPattern(aperture, distance,lambda,res_sensor)
p=2.44.*(lambda.*1e-9.*distance)./aperture;
n=p./res_sensor;
end