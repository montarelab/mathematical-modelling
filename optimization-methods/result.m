function Q=result(P)

  a=P(1);  % angles
  fi=P(2);

  s0=300;  % speed

  x0 = [0;0;0];
  v0 = s0 * [cos(a)*cos(fi);cos(a)*sin(fi);sin(a)];
  y0 = [x0;v0];

  n=1000;
  tf=30;
  [Y,t] = rk4('projectile',0,tf,y0,n);  % solve our system

  ind = find(Y(3,:)>0);  % finds all indeces for each true
  Y=Y(:, ind);
  t=t(ind);
  Q=Y(1:2, end);
  plot3(Y(1,:), Y(2,:), Y(3,:), 'g');

