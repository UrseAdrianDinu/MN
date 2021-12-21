function [percentage] = evaluate(path_to_testset,w,histogram,count_bins)
[X y]=preprocess(path_to_testset,histogram,count_bins);
[l c]=size(X);
X(:,c+1)=1;
w=w';
k=0;
for i=1:l
    a=dot(w',X(i,:)');
   if a>=0 && y(i)==1
     k++;
   elseif a<0 && y(i)==-1
   k++;
   endif 
endfor 
percentage=k/l;
endfunction
