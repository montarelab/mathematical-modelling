# Task 1


# Calculations
# Add X values and Function
xp = linspace(-1, 1, 21);
yp = xp.^2./(1+xp.^2);

# Approximation by a polynomial of degree 2.
# And find the coefficients of the polynomial are
A = [xp'.^2, xp', ones(21, 1)];
b = yp';
a = A\b; #Ax=b. 'a' in this example is 'x' in the formula





# The difference between the pair xp, yp (red lines) - approximation dots
# x, y(blue line) - just a function
# x, ya(red line) - approximation line





# On the same figure, draw the graph of the original function and the graph of
# the polynomial and mark the positions of the points used to calculate the
# approximation:
x = linspace(-1, 1);
y = x.^2./(1+x.^2);

# And the values of the polynomial approximation:
# Function 'polyval(p, x)'
# Where 'p' is a list of the corresponding coefficients
# And 'x' is a list of values of th uknown
ya = polyval(a, x);

# Draw graph part
plot(x, y, 'b')
hold on
plot(xp, yp, 'ro')
plot(x, ya, 'red')







# Let's find the polynomial of degree 20 that best fits the given 21 points.
# This will in fact be an interpolating polynomial that fits the given points
# exactly. Prepare a new matrix
A = xp'.^(20:-1:0);

# Right side b is the same as before, and the coefficients of the
# interpolating polynomial are:
a = A\b;

# Let's draw a sufficiently dense set of values for this polynomial and plot
# it on the same figure:
#ya = polyval(a, x);
#plot(x, ya)



# How do polynomial approximations and interpolations behave with real data?
# Let's first prepare data with artificially added error:
#yp = xp.^2./(1+xp.^2) + 0.001*rand(1, 21);

# We used the rand function; calling rand(m, n) returns m×n
# a matrix of random values between 0
# and 1. We can now repeat the calls on this data from line 3 onwards.
# Do this and compare the results.


# Task 2
# (d) Save the files transmitters.txt and distances.txt in the folder
# where you are running octave. Save the data:
# And find (e.g.) the position of the first receiver
P = load("transmitters.txt")
d = load("distances.txt")
receiver(P, d(:, 1))
#plot(P, d)


