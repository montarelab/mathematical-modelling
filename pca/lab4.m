n = 100; #data points
d=3; #dimension
A=rand(3);
A=A+A';
X=randn(n,3) * A + 3; #some data

figure(1);
plot3(X(:,1), X(:,2), X(:,3), 'rx');

Z=proj(X); #computes the projection of the data onto the principle

figure(2)
plot(Z(:,1), Z(:,2), "bo");
