function run_test()
    fout = fopen('out', 'w+');
    Labyrinth = parse_labyrinth("../../input/test1.in");
	Adj = get_adjacency_matrix(Labyrinth);
	[lines, cols, elem] = find(Adj);
	fdisp(fout, [lines, cols, elem]);
	fclose(fout);
end