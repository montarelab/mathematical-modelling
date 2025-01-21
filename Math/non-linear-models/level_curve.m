%
% returns n points on the level curve
% f(x,y)=c=f(x0,y0)
% separated by delta in an 2xn matrix K
% (with points on the curve in the columns of K)
#function K=level_curve(f,df,T0,delta,n)
#  c=feval(f, T0); % the level of our level curve
#  K=[T0]; # Initialize K

  % Function that defines out system of equations
#  G=@(T,T0) [feval(f,T)-c; norm(T-T0)^2-delta^2];
#  DG=@(T,T0) [feval(df,T); 2*(T(1)-T0(1)), 2*(T(2)-T0(2))];
#  T1=T0+[delta;0]; % the initial guess


#  for i=1:n
#      T1=newton(G,DG,T1,50,1e-12,T0);
#      K=[K T1];
#      v = T1-T0; % the direction of the next point
#      T0=T1; % overwrite T0
#      T1=T1+v; % the initial ........
#  endfor


function K = level_curve(f, gradf, T0, delta, n)
%K = level_curve(f, gradf, T0, delta, n) returns a sequence of points on
%the implicitly given curve f(x, y) = 0.
%f ....... the function (of two variables) f,
%gradf ... the gradient of f,
%T0 ...... starting point on the curve,
%delta ... Euclidean distance between two consecutive points,
%n ....... number of points.

%system II (correction to T0  - to obtain a point on the curve)
g = gradf(T0(1), T0(2));
ng = [-g(2); g(1)];

%define the function (and its Jacobi matrix) corresponding to system II
F = @(X) [f(X(1), X(2)); ng'*(X - T0)];
JF = @(X) [gradf(X(1), X(2))'; ng'];
%use T0 as an initial guess and solve system II using Newton's method
K(:, 1) = newton(F, JF, T0, 100, 1e-10);

%system I (obtaining succesive points on the curve)
for k = 2:n
	%define the function (and its Jacobi matrix) corresponding to system I
	F = @(X) [f(X(1), X(2)); (X - K(:, k-1))'*(X - K(:, k-1)) - delta^2];
	JF = @(X) [gradf(X(1), X(2))'; 2*(X - K(:, k-1))'];
	%determine the tangent through current point
	g = gradf(K(1,k-1), K(2,k-1));
	ng = [-g(2); g(1)];
	%evaluate the next point
	K(:, k) = newton(F, JF, K(:, k-1) + delta*ng/norm(ng));
	%break the loop once close enough to the starting point (in case of closed curve)
	if(norm(K(:, k) - K(:, 1)) < delta-10*eps)
		break;
	end
end

