% Function to calculate receiver positions based on transmitter positions and distances
% P: Matrix containing positions of transmitters [p1, q1; p2, q2; ...]
% d: Matrix containing distances from transmitters to receivers
% Returns: X, a matrix of calculated receiver positions [x1, y1; x2, y2; ...]
function X = receiver(P, d)
    % Compute the left-hand side of the linear system, matrix A
    % A is derived from the difference of transmitter coordinates
    A = 2 * (P(2:end, :) - P(1:end - 1, :));

    % Compute the right-hand side of the linear system, column vector b
    % b is based on the squared differences of distances and coordinates
    b = (d(1:end - 1, :).^2 - d(2:end, :).^2) + ...  % Distance squared differences
        (P(2:end, 1).^2 - P(1:end - 1, 1).^2) + ... % X-coordinate squared differences
        (P(2:end, 2).^2 - P(1:end - 1, 2).^2);      % Y-coordinate squared differences

    % Solve the linear system A * X = b using the least-squares method
    X = (A \ b)';
end

% Test Example
%!test
%! P = [0 0; 1 1; 2 0]; % Example transmitter positions
%! d = [1; 1; 1];        % Example distances from receivers
%! assert(receiver(P, d), [1, 0], eps); % Verify expected receiver position