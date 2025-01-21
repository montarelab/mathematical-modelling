% PCA function
function [mu, Vk, Uk, Dk] = (X, k) #x and k are data

  % 1. Centralization of data
  mu = mean(X);               #means for data
  [n, d]=size(X);             #dimensions of data
  X = X-ones(n,d) * diag(mu); #centered data

  Sigma=X' * X/(n-1); % Idk

  % 2. Calculate SVD
  [U,S,V]=svds(X,k);  % Takes first k singular value

  Uk=U(:, 1:k);       % first k left singular vectors (principal directions)
  Vk=V(:,1:k);        % first k right singular vectors (principal directions)
  s=diag(S);          % extract singular values
  Dk=s(1:k).^2/(n-1); % first k variances var(y_j) for principle components
