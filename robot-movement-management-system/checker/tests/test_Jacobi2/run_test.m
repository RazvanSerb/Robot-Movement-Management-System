function run_test()
    fout = fopen('out', 'w+');
    Labyrinth = parse_labyrinth("../../input/test2.in");
	Link = get_link_matrix(Labyrinth);
	[G, c] = get_Jacobi_parameters(Link);
	[lines, cols, elem] = find(G);
	fdisp(fout, [lines, cols, elem]);
	fdisp(fout, '');
	[lines, cols, elem] = find(c);
	fdisp(fout, [lines, cols, elem]);
end