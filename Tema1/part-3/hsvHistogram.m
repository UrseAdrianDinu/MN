function [sol] = hsvHistogram(path_to_image, count_bins)
    i=imread(path_to_image);
    [l c t]=size(i);
    [h s v]=fast(i);
    int=linspace(0,1.01,count_bins+1);
    s1=cumsum(histc(h,int),2)';
    s1=s1(c,:);
    s2=cumsum(histc(s,int),2)';
    s2=s2(c,:);
    s3=cumsum(histc(v,int),2)';
    s3=s3(c,:);
    sol=[s1 s2 s3];
    sol(count_bins+1)=[];
    sol(2*count_bins+1)=[];
    sol(3*count_bins+1)=[];
endfunction
