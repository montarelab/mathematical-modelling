#Projection of the data onto the principle directions

function Z=proj(X)
  [mu, Vk, Uk, Dk] = mypca(X, 2);
  n=size(Uk, 1)
  s=sqrt((n-1) * Dk)
  Z = [Uk(:,1)*s(1), Uk(:,2)*s(2)]



 # Function I should learn too
 # 1. sum for matrixes
 # 2.
