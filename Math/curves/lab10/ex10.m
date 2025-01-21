# Compute area
t=linspace(-pi/4, pi/4, 1000);  # values of the parameters
r=@(t) sqrt(cos(2*t));  # polar form of the limniscate
x=r(t).*cos(t);  # cartesian approximation
y=r(t).*sin(t);  #
T = [x;y];
[C, A] = CA_poligon(T)

# Compute line
t=linspace(0, 2*pi, 1000);  # values of the parameters
r=@(t) t.^2;  # polar form of the limniscate
x=r(t).*cos(t);  # cartesian approximation
y=r(t).*sin(t);  #
T = [x;y];
[C, A] = CA_poligon(T)

clf
hold on

u = linspace(0, 2*pi);
v = linspace(0, 2*pi);
R = 2;
r = 1;
[U,V] = meshgrid(u, v);  # meshgrid - ...
X = (R + r*cos(U)).*cos(V);
Y = (R + r*cos(U)).*sin(V);
Z = r*sin(U);
mesh(X,Y,Z);  # mesh - ...

% Plot a tangent plane
plot3(1, sqrt(3), 1, 'r.') % plot a point

axis equal
