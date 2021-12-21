function [sol] = rgbHistogram(path_to_image,count_bins)
    i=imread(path_to_image);
    [l c t]=size(i);
    int=linspace(0,256,count_bins+1);
    s1=cumsum(histc(i(:,:,1),int),2)';
    s1=s1(c,:);
    s2=cumsum(histc(i(:,:,2),int),2)';
    s2=s2(c,:);
    s3=cumsum(histc(i(:,:,3),int),2)';
    s3=s3(c,:);
    sol=[s1 s2 s3];
    sol(count_bins+1)=[];
    sol(2*count_bins+1)=[];
    sol(3*count_bins+1)=[];
endfunction
