% Exercise 1
% Creating a ready program to run,
% we initialized 2 function that return matrices
% and we run a newton function
% Init functions
% Define a function
F=@(X) [
X(1)^2 - X(2)^2 -1;
X(1)   + X(2)   -X(1)*X(2)-1
];

% Define a Jacobian function
% Returns a matrix
JF=@(X) [
2*X(1), -2*X(2);
1-X(2),  1-X(1)
];

% Run the newton iteration method
newton(F, JF, [2;1], 2000, 1e-10)
F(ans)

#newton(F,JF,[2;1],50,1e-12)
#newton(F,JF,[1;0],50,1e-12)
