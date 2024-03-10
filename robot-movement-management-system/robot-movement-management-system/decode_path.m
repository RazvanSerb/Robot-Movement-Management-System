% path -> vector containing the order of the states that arrived
% 		  to a winning position
% lines -> numeber of lines
% cols -> number of columns

% decoded_path -> vector of pairs (line_index, column_index)
%                 corresponding to path states
% hint: decoded_path does not contain indices for the WIN state

function [decoded_path] = decode_path(path, lines, cols)
  [num_cells, ONE] = size(path);
  decoded_path = zeros(num_cells - 1, 2);
  for i = 1 : (num_cells - 1)
    decoded_path(i, 2) = mod(path(i), cols);
    if (!decoded_path(i, 2))
      decoded_path(i, 2) = cols;
    endif
    decoded_path(i, 1) = (path(i) - decoded_path(i, 2)) / cols + 1;
  endfor
endfunction
