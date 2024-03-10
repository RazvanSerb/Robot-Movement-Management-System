% file_path -> the relative path to a file that needs 
%              to be loaded_graphics_toolkits

% Labyrinth -> the matrix of all encodings for the labyrinth's walls

function [Labyrinth] = parse_labyrinth(file_path)
  fin = fopen(file_path, 'r');
  m = fscanf(fin, "%d", 1);
  n = fscanf(fin, "%d", 1);
  Labyrinth = zeros(m, n);
  for i = 1 : m
    for j = 1 : n
      Labyrinth(i, j) = fscanf(fin, "%d", 1);
    endfor
  endfor
endfunction
