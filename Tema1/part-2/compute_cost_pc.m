function [cost] = compute_cost_pc(points, centroids)
[n d]=size(points);
[NC d]=size(centroids);
clusters=zeros(NC,1);
cost=0;
for i=1:n
    min=0;
    min=norm(points(i,:)-centroids(1,:));
    ind=1;
    for k=1:NC
        normcurr=norm(points(i,:)-centroids(k,:));
        if normcurr<=min
            min=normcurr;
            ind=k;
        endif
    endfor
    [l c]=size(clusters);
    ok=0;
    for j=1:c
        if clusters(ind,j)==0
            clusters(ind,j)=i;
            ok=1;
            break;
        endif
    endfor
    if ok==0
        clusters(ind,c+1)=i;
    endif
endfor
[a b]=size(clusters);
for i=1:NC
    for j=1:b
        if clusters(i,j)!=0
        cost=cost+norm(centroids(i,:)-points(clusters(i,j),:));
        endif
    endfor
endfor 
endfunction

