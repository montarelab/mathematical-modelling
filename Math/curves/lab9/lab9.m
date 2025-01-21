x = @(t) t.^3-4*t;
y = @(t) t.^2-4;

t4=2/sqrt(3);
t5=-2/sqrt(3);
[x(t4), y(t4)]
[x(t5), y(t5)]
clf
hold on

t=linspace(-3,3);
plot(x(t), y(t))

hold on
plot(x(t4), y(t4), 'ro')
plot(x(t5), y(t5), 'ro')
axis equal

#t=linspace(0,4*pi);
#x = @(t) t-sin(t) %parametrization of the cycloid
#y = @(t) 1-cos(t) %
#figure(3)
#clf
#hold on
#plot(x(y), y(t))
#asix equal

%

T=[1 2 3 4 5 3 2;1 -3 1 -2 2 4 3]
figure(4)
hold on
axis equal
