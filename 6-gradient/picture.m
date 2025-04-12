function picture(p,q, x) % plots the curves p and q
  t = linspace(0, 2*pi); % parameter values
  P=feval(p,t); %evaluate the values of p
  Q=feval(q,t); %evaluate the values of q
  plot(P(1,:), P(2,:), 'r')
  plot(Q(1,:), Q(2,:), 'g')

  A=feval(p, x(1)); % a point on p
  B=feval(q, x(2)); % a point on q
  plot([A(1), B(1)], [A(2), B(2)], 'k')
