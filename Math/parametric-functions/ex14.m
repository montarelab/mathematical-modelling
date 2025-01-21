% Task a

ia = linspace(-1, 1, 10);
x  = linspace(-2, 2);

clf
hold on

for a=ia
  y = x.^2+a;
  plot(x, y, 'b');
end

x = linspace(0, 2);
for a=ia
  y = log(x)/2+a;
  plot(x, y, 'b');
end
axis equal

% Task b

ia = linspace(-1, 1, 10);
x  = linspace(0.0001, 2);

clf
hold on

for a=ia
  y = a./x;
  plot(x, y, 'b');
end

x = linspace(0, 2);
for a=ia
  y = log(x)/2+a;
  plot(x, y, 'b');
end

axis equal
