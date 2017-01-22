%[FileName,folder] = uigetfile('*.png','Select calibration raw image');
%raw=im2double(imread(strcat(folder,FileName)));
    
%res=size(raw);
imagesc(raw), colormap gray, axis equal;
raw2 = imcrop;
close all

imagesc(raw2), colormap gray, axis equal;

res=size(raw2);
x=round(ginput(2));
ref_x=raw2(:,x(1));
ref_y=raw2(x(2),:);
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
    if comp>=30
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
    if comp>=30
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
figure, imagesc(gr*1000+raw2);
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
figure, imagesc(gr*1000+raw2);

save grid.mat gr