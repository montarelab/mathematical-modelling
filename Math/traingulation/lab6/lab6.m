% data for exercise 1
% todo: how can we use it?

xi = [0.038; 0.194; 0.425; 0.626; 1.253; 2.5; 3.74]

yi = [0.05; 0.127; 0.094; 0.2122; 0.2729; 0.2665; 0.3317]

clf # is ...
hold on
plot(xi, yi, 'ro')

f = @(a, x) a(1)*x./(a(2) + x);

a0=[0.4;1]; % initial guess for the valeus of our parameters
t = linspace(0, 4); % parameters for ploting our function

plot(t, f(a0,t),'b')
