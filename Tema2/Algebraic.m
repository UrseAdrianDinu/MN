function R = Algebraic(nume, d)  
  f= fopen(nume,'r');
  n=fscanf(f,"%d",1);
  adjmat=zeros(n);
  for i=1:n
    l=fscanf(f,"%d",1);
    nr=fscanf(f,"%d",1);
    for j=1:nr
      c=fscanf(f,"%d",1);
      adjmat(i,c)=1;
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
  M=(PR_Inv(k)*adjmat)';
  R=PR_Inv((eye(n)-d*M))*(1-d)/n*ones(n,1);
  fclose(f);
endfunction
	