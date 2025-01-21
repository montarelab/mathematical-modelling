x0 = [0;0;0];
v0 = [100;200;300];
y0 = [x0;v0];

n=1000;
tf=30;
[Y,t] = rk4('projectile',0,tf,y0,n);  % solve our system

ind = find(Y(3,:)>0);  % finds all indeces for each true
Y=Y(:, ind);
t=t(ind);
Y(1:2, end);

figure(1)
clf
hold on
plot3(Y(1,:), Y(2,:), Y(3,:), 'b');


target = [350; 300];
plot(target(1), target(2), 'rx');

P1 = [pi/4;pi/6];
Q1 = result(P1);

P2 = [pi/3;pi/4];
Q2 = result(P2);

P3 = [pi/3;pi/6];
Q3 = result(P3);

Q = [Q1 Q2 Q3];
P = [P1 P2 P3];

for k=1:9
  w = Q\target;
  X = P*w;
  S = result(X);
  plot(S(1), S(2),'ko')
  i = mod(k,3) + 1;
  P(:,i) = X;
  Q(:,i) = S;
endfor

clf
hold on
plot(Q1(1),Q1(2),'bo')
