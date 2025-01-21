% t0 - temp of env
% tf - temp in fridge
% n - number of steps
function [y, t] = rk4(fun, t0, tf, y0, n)

t = linspace(t0, tf, n);  % independent variable
h = t(2) - t(1);  % compute step size

d = length(y0);

y = zeros(d, n);  % space for solutions
y(:,1) = y0;  % initial value

for i=1:n-1
  k1 = feval(fun, t(i), y(:,i));  % current slope
  k2 = feval(fun, t(i) + h/2, y(:,i) + k1 * h/2);
  k3 = feval(fun, t(i) + h/2, y(:,i) + k2 * h/2);
  k4 = feval(fun, t(i) + h, y(:,i) + k3 * h/2);

  y(:,i+1) = y(:,i) + h*(k1 + 2*k2 + 2*k3 + k4) / 6;  % rk4 method
endfor
