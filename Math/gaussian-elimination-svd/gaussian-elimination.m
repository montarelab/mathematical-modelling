# LAB 3
# 1. Gaussian Elimination in Octave with 'rref' - Reduced Row Echelon Form
# and parameters matrix 'A' and vector 'b'


disp("Lab 3 #1")

% Init values
A = [-1 1 2; 1 -1 -2; 1 -1 2; -1 1 -2];
A1 = A(:, [1, 3]); # Matrix that uses the 1st and 3rd columns from matrix A
b = [3; -3; 2; 0];

% In code below we decided that systems have no solutions (based on ranks)
#disp("A | b")
#rref([A b]) #G. E. for Ax=b Gaussian Elimination
#disp("A1 | b")
#rref([A1 b]) #G. E. for A1x=b Gaussian Elimination


% Tbh, we would use SVD only if we don't use pinv() before,
% but implement this way by out own
%[U,S,V] = svd(A, "econ"); % "econ" here means Compact SVD

#Aplus = V*inv(S)*U'; % This case may produce Machine Perception error
Aplus = pinv(A)
Aplus1 = pinv(A1)

# The solution
%p = A1*inv(A1'*A1)*A1'*b; # The result is p = [3;-3;1;-1]

%
% Before it is written Manual Solution how to find Moore-Penrose matrices
% And we used SVD decomposition
%

# Find the final solution by G.E.
# rref([A p]);

# General Solution: x-y=1 AND z=1
#....... we add vectors u and v

#v = [1; 1; 0] # a solution
#u = [-1; 0; 1] # basis for null space N(A)
#v2 = A\b # Another solution
#v3 = pinv(A)*b # Also a solution (idk)
#A*v
#A*(v + 7*u)

#A*[0;1;1]

#inv(A'*A)

# 2. (Part 2 not a task 2) SUD DECOMPOSITION
#B = A'*A;
#eig(B)
#v2(-1;1;0)/sqrt(@)

# how to find s1 and s2
#u1=A*v1/s1 #left sign vector
#u2=A*v2/s2
#V=[v1 v2]
#S=diag([s1 s2])
#U=[u1 u2]
#[S1 S2] = svd()
#[U1, S1, V1] = svd(A, 'ecan')
#X=A
#U1*S1*V1'



