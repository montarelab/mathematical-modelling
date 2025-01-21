function graphF(F)
  % plots a contour plot of out function
  t=linspace(0,2*pi);
  s=linspace(0,2*pi);
  V=zeros(100); %space for the funciton values

  for i=1:100
    for j =1:100
      V(i,j) = feval(F, [t(i), s(j)]);
    endfor
  endfor

  contour(t,s,V',50)

