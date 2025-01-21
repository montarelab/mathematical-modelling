p=@(t) [5*cos(t); 3*sin(t)]; % curve p(t)
dp=@(t) [-5*sin(t); 3*cos(t)]; % p'(t)

q=@(s) [cos(s)-2; 2*sin(s)]; % curve q(s)
dq=@(s) [-sin(s); 2*cos(s)]; % q'(s)

r=@(x) p(x(1))-q(x(2)); % vector conecting p(t) and q(s)
dr = @(x) [dp(x(1)), -dq(x(2))]; % jacobian matrix of r

F = @(x) r(x)'*r(x); % the distance (squared) between the two points.
gradF=@(x) 2*dr(x)'*r(x);

x0 = [4.2,4.6];
X = gradientMethod(gradF, 0.01, x0, 100);


figure(1)
clf
hold on


picture(p,q, x0)

for i=1:100
  picture(p,q, X(:,i))
endfor

axis equal
sqrt(F(x0))


figure(2)
graphF(F)
