x0 = 1;                               % initial condition
Theta = @(t) [0; 0; 0];               % theta, and its derivatives
T = 0;                                % time interval
phi0_correct = pi/2;                  % Expected pos
phi0_test = onTarget(x0, Theta, T);
