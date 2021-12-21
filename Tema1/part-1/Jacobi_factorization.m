function [G_J, c_J] = Jacobi_factorization(A, b)
    dia=diag(A)';
    D=diag(dia);
    U=triu(A)-diag(dia);
    L=tril(A)-diag(dia);
    G_J=-inv(D)*(L+U);
    d=inv(D);
    c_J=d*b;
endfunction
