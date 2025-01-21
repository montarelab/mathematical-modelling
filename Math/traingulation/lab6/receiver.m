% todo: what is
% receiver,
% transmitter,
% transmitted positions
% adapted
% ad hoc
% what does it do
% fix 'end' issue

function X = receiver(P, d)
%X = receiver(P, d) returns semi-real ???
%X = [x, y] of the receiver,
%P = [p1, q1; p2, q2; ... ;pn, qn] are the transmitter positions, ???
%d = [di] are the distances of the receiver from the transmitters (n x 1 matrix)

% We find an initial approximation X0 as the solution
% of an 'adapted' (ad hoc) linear system.
% left-hand side of the system, matrix A
A = 2*(P(2:end, :) - P(1:end - 1, :));

% right-hand side of the system, column b
b = (d(1:end - 1, :).^2 - d(2:end, :).^2) + (P(2:end, 1).^2 - P(1:end - 1, 1).^2) + (P(2:end, 2).^2 - P(1:end - 1, 2).^2);


% the system A*X0 = b is solved by the linear least squares method
X0 = A\b;

% Define the function F that we want to minimise...
F = @(x) (x(1) - P(:, 1)).^2 + (x(2) - P(:, 2)).^2 - d.^2;

% Define its Jacobi matrix
JF = @(x) 2*(x' - P);

% Solve F(X) = 0 by Gauss-Newton iteration with initial approximation X0.
[X, k] = newton(F, JF, X0, 10^-10, 100);
X = X';

% tests
%!test
%!	P = [0 0; 1 1; 2 0];
%! d = [1; 1; 1];
%! assert(receiver(p, d), [1, 0], eps);
