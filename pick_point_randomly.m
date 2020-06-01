function point = pick_point_randomly(c, j, Train_Points)
	
	cj = c{j};
	
	i = randi(cj.n);
	while(cj.taken(i) == true)
		i = randi(cj.n);
	end
	
	cj.taken(i) = true;
	cj.n_available = cj.n_available - 1;
	
	point = Train_Points(:, cj.pos_vector(i));
end
