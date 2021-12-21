function [percentage] = evaluate(path_to_testset,w,histogram,count_bins)
cale1=strcat(path_to_testset,"cats/");
imgs1 = getImgNames(cale1);
cale2=strcat(path_to_testset,"not_cats/");
imgs2=getImgNames(cale2);
rgb="RGB";
[l1 c1]=size(imgs1);
[l2 c2]=size(imgs2);
k=0;
w=w';
for i=1:l1
  img=strcat(cale1,imgs1(i,:));
  if strcmp(histogram,rgb)==1
    [sol]=rgbHistogram(img,count_bins);
  else
    [sol]=hsvHistogram(img,count_bins);
   endif
   sol=[sol 1];
   a=dot(w',sol');
   if a>=0
     k++;
   endif
endfor
for i=1:l2
  img=strcat(cale2,imgs2(i,:));
  if strcmp(histogram,rgb)==1
    [sol]=rgbHistogram(img,count_bins);
  else
    [sol]=hsvHistogram(img,count_bins);
  endif
   sol=[sol 1];
    if dot(w',sol')<0
      k++;
    endif
endfor
percentage=k/(l1+l2);
endfunction
