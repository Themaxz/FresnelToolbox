load('self.mat');
ROI=self(1220:1762,1343:1903);
% F=ft0(self);
F=ft0(ROI);
fil=ones(size(ROI));
fil(round(end./2),round(end./2))=0;
f1=F.*fil;
fil2=gauss(size(ROI),.1);
f1=f1.*fil2;
figure, imagesc(abs(ift0(f1)));