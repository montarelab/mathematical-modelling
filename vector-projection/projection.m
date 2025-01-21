function pT = projection(A, b, T);
% pT = projection(A,b,T) returns the projection pT of T onto
% the hyperplane given by Ax=b.

% use the formula we just derived
pT = T + pinv(A) * (b - A*T);
