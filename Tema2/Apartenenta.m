function y = Apartenenta(x, val1, val2)

  %Conditii de continuitate:
  %a*val1+b=0
  %a*val2+b=1
  
  a=1/(val2-val1);
  b=val1/(val1-val2);
  if x>=0 && x<val1
    y=0;
  elseif x>=val1 && x<=val2
    y=a*x+b;
  elseif x>val2 && x<=1
    y=1;
  endif
endfunction

  
   
  
	