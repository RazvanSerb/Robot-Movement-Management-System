% Link -> the link matrix (edge with probabilities matrix)

% G -> iteration matrix
% c -> iteration vector

function [G, c] = get_Jacobi_parameters(Link)
  [num_states, num_states] = size(Link);
  G = sparse(num_states - 2, num_states - 2);
  G = Link(1 : (num_states - 2), 1 : (num_states - 2));
  c = sparse(num_states - 2, 1);
  c = Link(1 : (num_states - 2), num_states - 1);
endfunction
