function [w] = learn(X, y)
  [l c]=size(X);
  unu=ones(l,1);
  X1=[X ,unu];
  [Q R]=Householder(X1,y);
  b=Q'*y;
  w=SST(R,b);
endfunction
