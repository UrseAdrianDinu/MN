function hsv=RGB2HSV(RGB)
R1=single(RGB(1)/255);
G1=single(RGB(2)/255);
B1=single(RGB(3)/255);
a=double([R1 G1 B1]);
cmax=double(max(a));
cmin=min(a);
delta=double(cmax-cmin);
if delta==0
  hsv(1)=0;
else
  if cmax==R1
    hsv(1)=(60*mod(((G1-B1)/delta),6));
  endif
  if cmax==G1
    hsv(1)=(60*((B1-R1)/delta+2));
  endif
  if cmax==B1
    hsv(1)=(60*((R1-G1)/delta+4));
  endif
endif
hsv(1)=(hsv(1)/360);
if cmax==0
  hsv(2)=0;
 else
  hsv(2)=(delta/cmax);
endif
hsv(3)=(cmax);
endfunction