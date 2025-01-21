function x = dnewton(x0, F, tol, maxit)
% returns the solution of equation F(x) = 0,
% which is found by the discretized Newton method.
% x0    - initial approximation
% F     - function
% tol   - tolerance
% maxit - number of iterations
% returs: solution x

n = length(x0);     % data size
e = eye(n);         % identity matrix, standard basis vectors R^n
delta = sqrt(tol);  % choose step

for k = 1:maxit
	F0 = feval(F, x0);

	for j = 1:n  %computing the approximation for JF...
		ajac(:,j) = (feval(F, x0 +delta *e(:,j)) -F0)/delta;
	end

	x = x0 - ajac\F0;  %... and perform the Newton iteration step.
	if(norm(x -x0) < tol)
		break;
	end
	x0 = x;
end
