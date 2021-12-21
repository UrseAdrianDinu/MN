function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  fin= fopen(nume,'r');
  n=fscanf(fin,"%d",1);
  adjmat=zeros(n);
  for i=1:n
    l=fscanf(fin,"%d",1);
    nr=fscanf(fin,"%d",1);
    for j=1:nr
      c=fscanf(fin,"%d",1);
      adjmat(i,c)=1;
    endfor
  endfor
  val1=fscanf(fin,"%f",1);
  val2=fscanf(fin,"%f",1);
  fclose(fin);
  numeout=strcat(nume,".out");
  fout=fopen(numeout,"w");
  fprintf(fout,"%d\n\n",n);
  R1=Iterative(nume,d,eps);
  for i=1:n
    fprintf(fout,"%.6f\n",R1(i));
  end
  fprintf(fout,"\n");
  R2=Algebraic(nume,d,eps);
  for i=1:n
    fprintf(fout,"%.6f\n",R2(i));
  end
  fprintf(fout,"\n");
  [PR1 j]=sort(R2,'descend');
  for i=1:n
    fprintf(fout,"%d %d %.6f\n",i,j(i),Apartenenta(PR1(i),val1,val2));
  endfor
  fclose(fout);
endfunction

  