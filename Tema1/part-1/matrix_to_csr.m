function [values, colind, rowptr]=matrix_to_csr(A)
nz=0;
[n n]=size(A);
values=zeros(1,1);
colind=zeros(1,1);
rowptr=zeros(1,1);
for i=1:n
    for j=1:n
        if A(i,j)!=0
            values=[values A(i,j)];
            colind=[colind j];
            nz=nz+1;
        endif
    endfor
    rowptr=[rowptr nz+1];
endfor
values(1)=[];
colind(1)=[];
rowptr(1)=1;
endfunction
