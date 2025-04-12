function dydt = def_equation(t, y, Theta)
  % build differential eqaution based on inputs
  % params:  t     - terminal time
  %          y     = [phi, omega]
  %          Theta = [theta; theta_d; theta_dd] - initial
  % returns: dydt  = [phi_d; omega_d]

  theta     = Theta(t)(1);
  theta_d   = Theta(t)(2);
  theta_dd  = Theta(t)(3);
  phi      = y(1);
  omega    = y(2);

  % Construct derivations
  phi_d    = omega;
  omega_d  = -sin(phi) -theta_dd *cos(theta -phi) +theta_d^2 *sin(theta -phi);
  dydt = [phi_d; omega_d];
end

