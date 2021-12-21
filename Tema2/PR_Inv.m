function B = PR_Inv(A)
  n=size(A);
  [q r]=gram_sc(A);
  e=eye(n);
  x=zeros(n,1);
  for i=1:n
    x=SST(r,q'*e(:,i));
    B(:,i)=x;
  endfor
 endfunction