% Exercise 2

#f=@(X) (X(1)^2 + X(2)^2)^2 - 2*(X(1)^2 - X(2)^2);
#gradf = @(X) [ 4*(X(1)^2 + X(2)^2)*X(1) - 4*X(1),4*(X(1)^2 + X(2)^2)*X(2) + 4*X(2) ];

#f = @(X,Y) X^2 + Y^2/4 - 1;
#gradf =@(X, Y) [2*X, Y/2];


z = 0:0.1:1;
for i=length(z)
  K=level_curve(f,gradf,[0;i], 0.05, 200);
  figure(1)
  hold on
  plot(K(1,:),K(2,:),'r')
endfor
