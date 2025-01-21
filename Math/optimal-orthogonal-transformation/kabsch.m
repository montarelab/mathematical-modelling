function [Q, b] = kabsch(X, Y)
  % Kabsch algorithm to calculate Q and b
  % parameters:
  % X - matrix of data points
  % Y - matrix of the results
  % returns:
  % Q - matrix of rotation
  % b - vector of translation


  % 1. Calculate X and Y mean matrices
  Xmean = mean(X, 2);
  Ymean = mean(Y, 2);

  % 2. Create centroid matrices
  Xcentroid = X - Xmean;
  Ycentroid = Y - Ymean;

  % 3. Get C matrix
  C = Ycentroid * Xcentroid';

  % 4. Get SVD of C
  [U,S,V] = svd(C);
  [n, k]  = size(C);

  % 5. Build D matrix
  d = det(U*V');
  D = eye(n);

  % The most bottom-right entry must be -1
  % if the determinant of U*V' matrix is less than 0
  D(n, n) = d;

  % 6. Get Q matrix
  Q = U*D*V';

  % 7. Get b vector
  b = Ymean - Q * Xmean;
end

%!test
%!  X=[0, 1, 1, 0; 0, 0, 1, 1];
%!  Y=[1, 1, 2, 2; 0, 1, 1, 0];
%!  CorrectQ=[0 -1; -1 0];
%!  Correctb=[-1; 0];
%!  [testQ, testB] = naive(X, Y);
%!  assert(testQ, CorrectQ, 10^-4)
%!  assert(testB, Correctb, 10^-4)
