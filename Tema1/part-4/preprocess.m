function [X,y]=preprocess(path_to_dataset,histogram,count_bins)
cale1=strcat(path_to_dataset,"cats/");
imgs1 = getImgNames(cale1);
cale2=strcat(path_to_dataset,"not_cats/");
imgs2=getImgNames(cale2);
[l1 c1]=size(imgs1);
[l2 c2]=size(imgs2);
X=zeros(l1+l2,3*count_bins);
y=zeros(l1+l2,1);
y(1:l1)=1;
y(l1+1:l1+l2)=-1;
if strcmp(histogram,'RGB')==1
  ok=1;
else
  ok=0;
endif
for i=1:l1
  img=strcat(cale1,imgs1(i,:));
    if ok==1
    X(i,:)=rgbHistogram(img,count_bins);
    else
    X(i,:)=hsvHistogram(img,count_bins);
   endif
endfor
for i=1:l2
  img=strcat(cale2,imgs2(i,:));
    if ok==1
    X(l1+i,:)=rgbHistogram(img,count_bins);
    else
    X(l1+i,:)=hsvHistogram(img,count_bins);
   endif
endfor
  for i=1:3*count_bins
	  X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
	endfor
endfunction