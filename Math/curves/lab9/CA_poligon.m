%returns square of the poligon T
function C=CA_poligon(T)
  n=size(T,2); %number of columns (point)
  T=[T T(:,n)]; %expand the matrix
  A=0;

  plot(T(1:), T(2:))
  for i=1:n
    A=A+det(T(:, [i i+1]));
  endfor
  A=abs(A)/2;

