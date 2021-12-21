function R = Iterative(nume, d, eps)

  f=fopen(nume,"r");
  n=fscanf(f,"%f",1);
  adjmat=zeros(n);
  for i=1:n
    l=fscanf(f,"%f",1);
    c=fscanf(f,"%f",1);
    for j=1:c
      x=fscanf(f,"%f",1);
      adjmat(l,x)=1;
    endfor
  endfor
  for i=1:n
    adjmat(i,i)=0;
   endfor
  l=zeros(n,1);
  for i=1:n
    l(i)=sum(adjmat(i,:));
  endfor
  k=diag(l);
  m=(inv(k)*adjmat)';
  ri=zeros(n,1);
  ri(:)=1/n;
  rn=zeros(n,1);
  unu=ones(n,1);
  rn=d*m*ri+((1-d)/n)*unu;
  error=norm(rn-ri);
  while error>eps
    ri=rn;
    rn=d*m*ri+((1-d)/n)*unu;
    error=norm(rn-ri);
  endwhile
  R=ri;
  fclose(f);
endfunction