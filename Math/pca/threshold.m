
# Desctiption.. threshold - limit, порог, предел

# Study material. If we use statement without a SEMICOLON, if means
# console function call

# cumsum - cumulative sum of A (along the dimension dim)

function r = threshold(X,p)
  d = size(X,2); # Number of columns
  [mu, Uk, Vk, Dk] = mypca(X, 3);
  cumsum(Dk / sum(Dk))

  % indices() - ...
  indices=find(cumsum(Dk / sum(Dk)) > p) # indices of sums where
  # the relative variance exceeds the threshold
  r = indices(1)

