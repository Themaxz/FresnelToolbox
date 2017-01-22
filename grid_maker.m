clear all
close all
folder='C:\Users\Massimo\Documents\MATLAB\aberrazioni HM\-1\';
T1=.3;
T2=.3;
raw=im2double(imread(strcat(folder,'calibration.png')));
res=size(raw);
imagesc(raw), colormap gray, axis equal;
x=round(ginput(2));
ref_x=raw(:,x(1));
ref_y=raw(x(2),:);
os=[0 0];
figure, plot(ref_x), title ('refx');
prompt='input x axis treshold';
T1=input(prompt)
index1=find(ref_x<=T1);

figure, plot(ref_y), title('refy');

prompt='input y axis treshold';
T2=input(prompt)
index2=find(ref_y<=T2);
lim=max(size(index1));

k=1;

for i=1:lim-1
    comp=index1(i+1)-index1(i);
    if comp>1
        indx(k)=index1(i); %#ok<SAGROW>
         k=k+1;
    end
   
end
lim=max(size(indx));
k=1;
ind=indx;
for i=1:lim-1
    comp=ind(i+1)-ind(i);
    if comp>=50
        ind1(k)=ind(i); %#ok<SAGROW>
         k=k+1;
    end
   
end
lim=max(size(index2));
k=1;

for i=1:lim-1
    comp=index2(i+1)-index2(i);
    if comp>1
        indy(k)=index2(i); %#ok<SAGROW>
         k=k+1;
    end
   
end
lim=max(size(indy));
k=1;
ind=indy;
for i=1:lim-1
    comp=ind(i+1)-ind(i);
    if comp>=40
        ind2(k)=ind(i); %#ok<SAGROW>
         k=k+1;
    end
   
end
start1=find(ind1>=0, 1 );
finish=find(ind1<=res(1), 1, 'last' );
start2=find(ind2>=0, 1 );

% starty=min(find(centery>=0));
% finishy=max(find(centery<=res(2)))
gr=zeros(res);
for i=start1:finish
    for j=start2:max(size(ind2))
        i1=round(ind1(i)+os(1));
        i2=round(ind2(j)+os(2));
        gr(:,i2)=1;
    end
    gr(i1,:)=1;
end
figure, imagesc(gr+raw);
os(1)=input('enter x offset: ');
os(2)=input('enter y offset: ');
gr=zeros(res);
for i=start1:finish
    for j=start2:max(size(ind2))
        i1=round(ind1(i)+os(1));
        i2=round(ind2(j)+os(2));
        gr(:,i2)=1;
    end
    gr(i1,:)=1;
end
figure, imagesc(gr+raw);

save grid.mat gr
% x_line=[x(1),x(2)];
% y_line=[y(1),y(2)];
% ref_x= improfile(raw,x_line,y_line);

