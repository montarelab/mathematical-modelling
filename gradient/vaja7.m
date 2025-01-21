f=@(x) (1-x(1))^2+4*(x(2)-x(1))^2; % funciton from exercise 1
gradf=@(x) [2*(x(1)-1)-16*(x(2) - x(1)^2)*x(1); 8*(x(2)-x(1)^2)]; % gradient of the function f


X=gradientMethod(gradf, 0.01, [1.5,1.5], 5000);
plot(X(1,:), X(2,:), 'ro')
X(:, end)

