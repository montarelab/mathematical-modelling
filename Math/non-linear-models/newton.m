% Initializing of 'newton' function


% returns numerical approx. x the (system of) equations
% f(x)=0, where
% 'df' is the derivative (or Jacobian matrix) of 'f',
% 'x0' is initial guess for the solution,
% 'maxit' is the maximum allowed number of iterations
% 'maxerror' is desired accurancy
% 'par' is an additional optional possible argument we can pass to 'f' and 'df'
function x=newton(f, df, x0, maxit, maxerror)
  k=0; % counter for iterations
  err=maxerror+1; % initiate the current error

  while k < maxit && err > maxerror
    k++;

    % function feval() calculates a function with given values
    % Gets a matrix norm is
    x = x0-feval(df,x0) \ feval(f,x0); % Newtons iteration

    % function norm() computes a p-norm of a matrix
    % function's norm is a measure of the magnitude of the matrix
    % in this case it is the 2nd form
    % and it returns the largest singular value
    % norm(x-x0) = max(svd(x-x0))
    err=norm(x-x0); % estimate for our error
    x0=x; % overwrite the previous approx.
  endwhile


