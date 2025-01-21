g = @(t, y) -t * y;
t = linspace(0,4);
ys = exp(-t.^2/2);  % exact solution
[ye, t] = euler(g,0,4,1,100);  % euler method
[yrk, t] = rk4(g,0,4,1,100);  % rk4 method

clf
hold
plot(t, ys, 'k');
plot(t, ye, 'g');
plot(t, yrk, 'r');

figure(2)
plot(t, ys-ye);

figure(3)
plot(t, ys-yrk);
