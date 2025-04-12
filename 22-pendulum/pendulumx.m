function pos = pendulumx(Phi0, Theta, T)
  % pos = pendulum(Phi0, Theta, T) which, given initial conditions
  % Phi0 = [phi0; omega0] and a function Theta(t) = [Theta(t); Theta˙(t); Theta¨(t)],
  % solves the differential equation until the terminal time T and returns
  % the position pos = [x; y] of the point mass at the time T

  %% denote the system of equations
  %% and we use that m = g = L = l = 1
  f = @(t, y) [
    y(2);
    -Theta(t)(3) * cos(Theta(t)(1) - y(1)) + Theta(t)(2)^2 * sin(Theta(t)(1) - y(1)) - sin(y(1))
  ];

  %% step of the RK4 method
  h = 0.01;

  t = 0:h:T;        %%% divide the interval with step h
  Y(:, 1) = Phi0;   %%% initial condition

  % run the RK4 method

  disp('num')
  disp(length(t))

  for j = 1:(length(t)-1)
    k1 = h * f(t(j),       Y(:, j));
    k2 = h * f(t(j) + h/2, Y(:, j) + k1/2);
    k3 = h * f(t(j) + h/2, Y(:, j) + k2/2);
    k4 = h * f(t(j) + h,   Y(:, j) + k3);

    Y(:,j+1) = Y(:, j) + 1/6 * (k1 + 2 * k2 + 2 * k3 + k4);
  end

  phi = Y(:,end)(1)

  %%% x and y are the coordinates in time T
  x = sin(Theta(T)(1)) + sin(Y(:,end)(1));
  y = -1 * cos(Theta(T)(1)) - cos(Y(:,end)(1));
  pos = [x; y];

% tests
%!test
%! Phi0 = [pi/2; 0];  % initial condition
%! Theta = @(t) [0; 0; 0];  % theta, and its derivatives
%! T = 0;  % time interval
%! pos_correct = [1; -1];  % Expected pos
%! pos_test = pendulumx(Phi0, Theta, T);
%! assert(pos_test, pos_correct, 1e-5);
%!test
%! format long
%! Theta = @(t) [sin(2*t); 2*cos(2*t); -4*sin(2*t)]
%! Phi0 = [pi/2; 1];  % 1.5708, 1.0000
%! T = 1;
%! correct = [1.6305; 0.8454];  % expected result
%! pos = pendulumx(Phi0, Theta, T)  % real result
%! assert(pos, correct, 10^-4)



