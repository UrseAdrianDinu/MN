function [H S V]=fast(i)
  i=cast(i,"double");
  i=double(i./255);
  r=i(:,:,1);
  g=i(:,:,2);
  b=i(:,:,3);
  [l c]=size(r);
  cmin=min(min(r,g),b);
  cmax=max(max(r,g),b);
  delta=double(cmax- cmin);
  H=zeros(l,c);
  S=zeros(l,c);
  V=zeros(l,c);
  p=delta==0;
  H(p)=0;
  a=cmax==r & delta~=0;
  H(a)=60*mod((g(a)-b(a))./delta(a),6);
  e=cmax==g & delta~=0;
  H(e)=60*((b(e)-r(e))./delta(e)+2);
  c=cmax==b & delta~=0;
  H(c)=60*((r(c)-g(c))./delta(c)+4);
  H=H./360;
  d=cmax==0;
  S(d)=0;
  S=delta./cmax;
  V=cmax; 
endfunction
