function pos = pendulum(Phi0, Theta, T)
% params:  Phi0  = [phi0; omega0] - initial angles
%          Theta = [theta; theta_d; theta_dd] - initial
%          T     - terminal time
% returns: pos   = [x; y] - position of bob

  % 1. create differential equation
  fun = @(t, Y) [
    Y(2);
    -sin(Y(1)) - Theta(t)(3) * cos(Theta(t)(1) - Y(1)) + Theta(t)(2)^2 * sin(Theta(t)(1) - Y(1))
  ];

  % 2. Use RK4 to solve the equation
  h = 0.01;   % step size
  t = 0:h:T;  %pripravimo vrstico casov t
  Y = zeros(length(Phi0), length(t));  % pripravimo vrednosti Y
  Y(:, 1) = Phi0;  % initial values

  for k = 1:(length(t) - 1)
    k1 = h*fun(t(k),       Y(:, k));
    k2 = h*fun(t(k) + h/2, Y(:, k) + k1/2);
    k3 = h*fun(t(k) + h/2, Y(:, k) + k2/2);
    k4 = h*fun(t(k) + h,   Y(:, k) + k3);
    Y(:, k + 1) = Y(:, k) + (k1 + 2*k2 + 2*k3 + k4)/6;
  endfor

  % 3. get coordinates x and y
  theta = Theta(T)(1);
  phi   = Y(:,end)(1);

  x   =  sin(theta) + sin(phi);
  y   = -cos(theta) - cos(phi);
  pos = [x; y];
end
% tests
%! format long
%!test
%! Phi0 = [pi/2; 0];        % initial condition
%! Theta = @(t) [0; 0; 0];  % theta, and its derivatives
%! T = 0;                   % time interval
%! pos_correct = [1; -1];   % Expected pos
%! pos_test = pendulum(Phi0, Theta, T);
%! assert(pos_test, pos_correct, 1e-5);
%!test
%! Theta = @(t) [sin(2*t); 2*cos(2*t); -4*sin(2*t)];
%! Phi0 = [pi/2; 1];
%! T = 1;
%! correct = [1.7878; -0.56347];  % expected result
%! pos = pendulum(Phi0, Theta, T);  % real result
%! assert(pos, correct, 10^-4)
%!test
%! Theta = @(t) [ cos(t) + sin(t);
%! -sin(t) + cos(t);
%! -cos(t) + -sin(t); ];
%! Phi0 = [3*pi/4; pi/6];
%! T = 10;
%! correct = [-1.5034; 0.66696];  % expected result
%! pos = pendulum(Phi0, Theta, T);  % real result
%! assert(pos, correct, 10^-4)
%!test
%! Theta = @(t) [
%! cos(t)  * sin(2*t);
%! -sin(t)*sin(2*t) + 2*cos(t)*cos(2*t);
%! -5*cos(t)*sin(2*t) - 4*sin(t)*cos(2*t)];
%! Phi0 = [3*pi/4; pi/6];
%! T = 10;
%! correct = [-1.6932; -0.73268];
%! pos = pendulum(Phi0, Theta, T);  % real result
%! assert(pos, correct, 10^-4)
%!test
%! Theta = @(t) [sin(2*t); 2*cos(2*t); -4*sin(2*t)];
%! Phi0 = [pi/2; 1];  % 1.5708, 1.0000;
%! T = 1;
%! correct = [1.7878; -0.56347];  % expected result
%! pos = pendulum(Phi0, Theta, T);  % real result
%! assert(pos, correct, 10^-4)
