function [Q, b] = naive(X, Y)
  % Naive approach to calculate Q and b
  % parameters:
  % X - matrix of data points
  % Y - matrix of the results
  % returns:
  % Q - matrix of rotation
  % b - vector of translation


  % Get sizes of X, where
  % n - number of vectors. k - the value of vectors' dimension
  [k, n] = size(X);

  % 1. Extend X with a row of ones
  X_extended = [X; ones(1, n)];

  % 2. Solve for Q and b using the least squares method
  A = Y / X_extended;

  % 3. Do QR decomposition of Q to get orthogonal matrix Q
  [Q, R] = qr(A);

  # 4. Extract vector b from matrix A
  b = A(:, end);

end
%!test
%!  X=[0, 1, 1, 0; 0, 0, 1, 1];
%!  Y=[1, 1, 2, 2; 0, 1, 1, 0];
%!  CorrectQ=[0 -1; -1 0];
%!  Correctb=[1; 0];
%!  [testQ, testB] = naive(X, Y);
%!  assert(testQ, CorrectQ, 10^-4)
%!  assert(testB, Correctb, 10^-4)
