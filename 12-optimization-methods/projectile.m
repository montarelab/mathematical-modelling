function dy=projectile(t,y)
  x=y(1:3);
  v=y(4:6);
  c=0.004;
  w=[5;-2;0];
  g=[0;0;-9.81];
  dy=[v;g + c*(w-v) * norm(w-v)];  % Newton law
