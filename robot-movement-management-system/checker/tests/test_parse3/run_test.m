function run_test()
    fout = fopen('out', 'w+');
    Labyrinth = parse_labyrinth("../../input/test3.in");
    for i=1:size(Labyrinth, 1)
        fprintf(fout, '%d ', Labyrinth(i,:));
        fprintf(fout, '\n');
    endfor
    fclose(fout);
end