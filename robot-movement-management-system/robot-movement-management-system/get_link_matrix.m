% Labyrinth -> the matrix of all encodings

% Link -> the link matrix associated to the given labyrinth

function [Link] = get_link_matrix(Labyrinth)
  [m, n] = size(Labyrinth);
  NodeNumber = zeros(m, n);
  for i = 1 : m
    for j = 1 : n
      NodeNumber(i, j) = n * (i - 1) + j;
    endfor
  endfor
  NodeNumberWIN = m * n + 1;
  NodeNumberLOSE = m * n + 2;
  nr_stari = m * n + 2;
  Link = sparse(nr_stari, nr_stari);
  for i = 1 : m
    for j = 1 : n
      bit0 = mod(bitshift(Labyrinth(i, j), 0), 2);
      bit1 = mod(bitshift(Labyrinth(i, j), -1), 2);
      bit2 = mod(bitshift(Labyrinth(i, j), -2), 2);
      bit3 = mod(bitshift(Labyrinth(i, j), -3), 2);
      num_free_direction = !(bit0) + !(bit1) + !(bit2) + !(bit3);
      if (!bit3)
        if ((i - 1) > 0)
          Link(NodeNumber(i, j), NodeNumber(i - 1, j)) = 1 / num_free_direction;
        else
          Link(NodeNumber(i, j), NodeNumberWIN) = 1 / num_free_direction;
        endif
      endif
      if (!bit2)
        if ((i + 1) <= m)
          Link(NodeNumber(i, j), NodeNumber(i + 1, j)) = 1 / num_free_direction;
        else
          Link(NodeNumber(i, j), NodeNumberWIN) = 1 / num_free_direction;
        endif
      endif
      if (!bit1)
        if ((j + 1) <= n)
          Link(NodeNumber(i, j), NodeNumber(i, j + 1)) = 1 / num_free_direction;
        else
          Link(NodeNumber(i, j), NodeNumberLOSE) = 1 / num_free_direction;
        endif
      endif
      if (!bit0)
        if ((j - 1) > 0)
          Link(NodeNumber(i, j), NodeNumber(i, j - 1)) = 1 / num_free_direction;
        else
          Link(NodeNumber(i, j), NodeNumberLOSE) = 1 / num_free_direction;
        endif
      endif
    endfor
  endfor
  Link(NodeNumberWIN, NodeNumberWIN) = 1;
  Link(NodeNumberLOSE, NodeNumberLOSE) = 1;
endfunction
