% start_position -> the starting point in the labyrinth
% probabilities -> vector of associated probabilities: including WIN and LOSE
% Adj -> adjacency matrix

% path -> the states chosen by the algorithm

function [path] = heuristic_greedy(start_position, probabilities, Adj)
  [num_states, num_states] = size(Adj);
  NodeNumberWIN = num_states - 1;
  last = 1;
  path = zeros(num_states, 1);
  path(last) = start_position;
  visited = sparse(num_states, 1);
  visited(start_position) = 1;
  while (last)
    position = path(last);
    if (position == NodeNumberWIN)
      break;
    endif
    num_unvisited_neigh = 0;
    unvisited_neigh = sparse(4, 1);
    for j = 1 : num_states
      if ((Adj(position, j)) && (!visited(j)))
        num_unvisited_neigh++;
        unvisited_neigh(num_unvisited_neigh) = j;
      endif
    endfor
    if (!num_unvisited_neigh)
      path(last) = 0;
      last--;
    else
      max_prob = probabilities(unvisited_neigh(1));
      neigh = unvisited_neigh(1);
      for i = 2 : num_unvisited_neigh
        if (probabilities(unvisited_neigh(i)) > max_prob)
          max_prob = probabilities(unvisited_neigh(i));
          neigh = unvisited_neigh(i);
        endif
      endfor
      last++;
      path(last) = neigh;
      visited(neigh) = 1;
    endif
  endwhile
  path = resize(path, nnz(path), 1);
endfunction
