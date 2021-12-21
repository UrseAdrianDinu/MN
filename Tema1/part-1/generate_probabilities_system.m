function [A, b] = generate_probabilities_system(rows)
    nr=rows*(rows+1)/2;
    A=zeros(nr);
    b=zeros(1,nr)';
    b(nr:-1:nr-rows+1)=1;
    A(1,1)=4;
    A(1,2)=A(1,3)=-1;
    A(2,2)=5;
    A(2,1)=A(2,3)=A(2,4)=A(2,5)=-1;
    A(3,3)=5;
    A(3,1)=A(3,2)=A(3,5)=A(3,6)=-1;
    st=nr-rows+1;
    A(st,st)=4;
    A(st,st+1)=-1;
    A(st,st-rows+1)=-1;
    A(nr,nr)=4;
    A(nr,nr-1)=-1;
    A(nr,nr-rows)=-1;
    t=1;
    for i=1:rows-1
      t=t+i;
      if t!=st
        A(t,t)=5;
        A(t,t+1)=-1;
        A(t,t-i)=-1;
        A(t,t+i+1)=-1;
        A(t,t+i+2)=-1;
     endif
    endfor
    t=1;
    for i=2:rows-1;
        t=t+i;
        if(t!=nr)
            A(t,t)=5;
            A(t,t-1)=-1;
            A(t,t-i)=-1;
            A(t,t+i+1)=-1;
            A(t,t+i)=-1;
        endif
    endfor
    for i=st+1:nr-1
        A(i,i)=5;
        A(i,i-1)=-1;
        A(i,i+1)=-1;
        A(i,i-rows)=-1;
        A(i,i-rows+1)=-1;
    endfor
        c=3;
    for c=3:1:rows-1
        for i=(c*(c+1)/2-c+2):1:(c*(c+1)/2-1)
            A(i,i-c)=-1;
            A(i,i-c+1)=-1;
            A(i,i-1)=-1;
            A(i,i+1)=-1;
            A(i,i+c)=-1;
            A(i,i+c+1)=-1;
            A(i,i)=6;
        endfor
    endfor
endfunction
