function [w] = learn(X, y, lr, epochs)
w=gradientdescent(X,y,lr,epochs);
endfunction
