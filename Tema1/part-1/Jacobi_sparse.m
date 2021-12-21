function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
n=size(G_rowptr,2);
x0=zeros(1,n-1);
error=2*tol;
while error >= tol
    xn=csr_multiplication(G_values,G_colind,G_rowptr,x0)+c;
    error=abs(norm(xn,2)-norm(x0,2));
    x0=xn;
endwhile
x=xn;
endfunction
