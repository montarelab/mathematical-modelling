function phi0 = onTarget(x0, Theta, T)
% given x-component of x0 returns initial angle phi0.
% uses secant method
% params:  x0    - coordinate x when target hits bob
%          Theta = [theta; theta_d; theta_dd] - initial
%          T     - terminal time
% returns: pos   = [x; y] - position of bob
% conditions: w0 = 0 - initial speed

  % 1. define a function to compute x based on phi0
  function x = compute_x(phi0)  % computes x based on phi0
    Phi0 = [phi0; 0]; % initial condition [phi0; omega0 = 0]
    pos = pendulum(Phi0, Theta, T);
    x = pos(1) - x0;
  end

  % Use a secant method to solve compute_x(phi0) = x0
  maxit = 100;
  tol   = 1e-13;

  X = [0, pi/2];     % prepare initial approximations
  delta = sqrt(tol);  % select a step
  [n, m] = size(X);  % store the size and number of initial approximations; m = n+1
  e1 = [1;zeros(n,1)];  % prepare first basis vector R^(n+1)

  %At each step of the iteration, a new approximation x = X*z is calculated, where
  %z is the solution of the system Z*z=e1 for the matrix Z=[1, ..., 1; F(x0), ..., F(xn)].
  %(This x is just the solution of the equation A*x+b=0, where x -> A*x+b is an affine approximation of
  %for F given initial approximations x0, ..., xn.)

  %Before starting the iteration, prepare Z.
  %(Within the iteration, we will only correct the last step of Z.)
  for j = 1:m
    Z(:,j) = [1; compute_x(X(:,j))];
  end

  for k = 1:maxit
    phi0 = X*(Z\e1);		% new approximation
    Fx = compute_x(phi0);
    if(norm(Fx) < tol)
      break;
    end
    X = [X(:,2:m),phi0];	                % add new approximation to X, discard the first one
    Z = [Z(:,2:m),[1; compute_x(phi0)]];	% correct the last column Z, discard the first one
  end

end

% tests
%!test
%! x0 = 1;  % initial condition
%! Theta = @(t) [0; 0; 0];  % theta, and its derivatives
%! T = 0;  % time interval
%! phi0_correct = pi/2;  % Expected pos
%! phi0_test = onTarget(x0, Theta, T);
%! assert(phi0_test, phi0_correct, 1e-5);
