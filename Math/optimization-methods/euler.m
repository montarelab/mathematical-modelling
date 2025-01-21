% t0 - temp of env, begin of interval
% tf - temp in fridge, end of interval
% n - number of steps
function [y, t] = euler(fun, t0, tf, y0, n)

t = linspace(t0, tf, n);  % independent variable
h = t(2) - t(1);  % compute step size

d = length(y0);

y = zeros(d, n);  % space for solutions
y(:,1) = y0;  % initial value

for i=1:n-1
  k = feval(fun, t(i), y(:,i));  % current slope
  y(:,i+1) = y(:,i) + h*k;  % euler method
endfor
