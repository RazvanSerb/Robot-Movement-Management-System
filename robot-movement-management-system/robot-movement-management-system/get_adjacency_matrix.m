% Labyrinth -> the matrix of all encodings

% Adj -> the adjacency matrix associated to the given labyrinth

function [Adj] = get_adjacency_matrix(Labyrinth)
  [m, n] = size(Labyrinth);
  NodeNumber = sparse(m, n);
  for i = 1 : m
    for j = 1 : n
      NodeNumber(i, j) = n * (i - 1) + j;
    endfor
  endfor
  NodeNumberWIN = m * n + 1;
  NodeNumberLOSE = m * n + 2;
  num_states = m * n + 2;
  Adj = sparse(num_states, num_states);
  for i = 1 : m
    for j = 1 : n
      bit0 = mod(bitshift(Labyrinth(i, j), 0), 2);
      bit1 = mod(bitshift(Labyrinth(i, j), -1), 2);
      bit2 = mod(bitshift(Labyrinth(i, j), -2), 2);
      bit3 = mod(bitshift(Labyrinth(i, j), -3), 2);
      if (!bit3)
        if ((i - 1) > 0)
          Adj(NodeNumber(i, j), NodeNumber(i - 1, j)) = 1;
        else
          Adj(NodeNumber(i, j), NodeNumberWIN) = 1;
        endif
      endif
      if (!bit2)
        if ((i + 1) <= m)
          Adj(NodeNumber(i, j), NodeNumber(i + 1, j)) = 1;
        else
          Adj(NodeNumber(i, j), NodeNumberWIN) = 1;
        endif
      endif
      if (!bit1)
        if ((j + 1) <= n)
          Adj(NodeNumber(i, j), NodeNumber(i, j + 1)) = 1;
        else
          Adj(NodeNumber(i, j), NodeNumberLOSE) = 1;
        endif
      endif
      if (!bit0)
        if ((j - 1) > 0)
          Adj(NodeNumber(i, j), NodeNumber(i, j - 1)) = 1;
        else
          Adj(NodeNumber(i, j), NodeNumberLOSE) = 1;
        endif
      endif
    endfor
  endfor
  Adj(NodeNumberWIN, NodeNumberWIN) = 1;
  Adj(NodeNumberLOSE, NodeNumberLOSE) = 1;
endfunction
