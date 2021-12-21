function [centroids] = clustering_pc(points, NC)
[n d]=size(points);
clusters=zeros(NC,1);
for i=1:NC
    k=i;
    j=1;
    while k <=n
        clusters(i,j)=k;
        j=j+1;
        k=k+NC;
    endwhile 
endfor
[a b]=size(clusters);
centroids=zeros(NC,d);
for i=1:NC
    s=zeros(1,d);
    k=0;
    for j=1:b
        if clusters(i,j)!=0
        s=s+points(clusters(i,j),:);
        k++;
        endif
    endfor
    s=s/k;
    centroids(i,:)=s;
endfor
l=0;
curr=zeros(NC,1);
while l==0
    clusters=curr;
    curr =zeros(NC,1);
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
        [l c]=size(curr);
        ok=0;
        for j=1:c
            if curr(ind,j)==0
                curr(ind,j)=i;
                ok=1;
                break;
            endif
        endfor
        if ok==0
            curr(ind,c+1)=i;
        endif
    endfor
    [a b]=size(curr);
    centroids=zeros(NC,d);
    for i=1:NC
        contor=0;
        suma=zeros(1,d);
        for j=1:b
            if curr(i,j)!=0
                suma=suma+points(curr(i,j),:);
                contor++;
            endif
        endfor
        if contor !=0
        suma=suma/contor;
        centroids(i,:)=suma;
        endif
    endfor
    l=isequal(curr,clusters);
endwhile    
endfunction

