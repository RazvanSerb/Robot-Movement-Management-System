% G -> iteration matrix
% c -> iteration vector
% x0 -> initial solution
% tol -> accepted tolerance (norm of the difference between two solutions)
% max_steps -> the maximum number of iterations

% x -> final solution
% err -> last calculated difference (as an euclidean norm)
% steps -> actual number of steps performed

function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
  [num_probabilities, num_probabilities] = size(G);
  xp = sparse(num_probabilities, 1);
  xp = x0;
  x = sparse(num_probabilities, 1);
  x = G * xp + c;
  err = norm(x - xp, 2);
  steps = 1;
  while ((err > tol) && (steps < max_steps))
    xp = x;
    x = G * xp + c;
    err = norm(x - xp, 2);
    steps++;
  endwhile
endfunction
