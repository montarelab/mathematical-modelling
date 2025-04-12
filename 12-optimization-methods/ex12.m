n=100;
xf = 1.5;

x=linspace(1,1.5, n);
clf
hold on

plot(x, tan(x.^2-1), 'b')

f=@(x, y) 2*x.*(1+y.^2)
[y, x] = euler(f, 1, xf, 0, n);
plot(x, y, 'r')
