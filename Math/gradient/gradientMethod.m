function x = gradientMethod(gradf, h, x0, maxit)
  % a version of gradient method which returns maxit
  % successsive approximations for the minimum of f (given
  % the gradient gradf of )
  # x = [x0, x1, ... xn]
  # h - step size
  # x0 - ...
  # tol - tolerance
  # maxit - maximal iteration

  X=zeros(length(x0), maxit); % reserving space
  X(:,1) = x0; % setting the initial approx.
  for i=2:maxit
    x = x0-h*feval(gradf,x0); % next approx.
    X(:,i) = x; % save the current approx. in the next column
    x0 = x; % Overwriting the previous approx.
  endfor
