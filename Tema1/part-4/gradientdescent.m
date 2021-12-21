function [w]= gradientdescent(X,y,lr,epochs)
[l c]=size(X);
X(:,c+1)=1;
w = (0.2).*rand(c+1,1)- 0.1;
for epoch=1:epochs
  r=randperm(length(X),64);
  X_batch=X(r,:);
  Y_batch=y(r);
  suma = 0;
  for i=1:c+1
    for j=1:64
  	  suma = suma + ((X_batch(j,:)*w)-Y_batch(j)*X_batch(j,i));
    endfor
	  w(i) = w(i) - lr/l*suma; 
  endfor
endfor
endfunction
