function labels = classify(ec, points_set)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function labels = classify(ec, point_set)
%
% Arguments:
% ec:
%	A euclidean classifier.
%
% point_set:
%	A d x n matrix, where d is the dimension and n is the
%	number of points to be classified.
%
% Return Value:
% labels:
%	A 1 x n matrix containing the classes of points_set as
%	estimated by ec.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	% για κάθε σημείο
	[d, n] = size(points_set);
	printf("\nEuclidean Classifier: %d points will be classified\n", n);
	labels = zeros(1, n);
	for i = 1:n
		% υπολόγισε την απόσταση του σημείου από τον μέσο της j-οστής κλάσης
		D = zeros(1, ec.n_classes);
		for j = 1:ec.n_classes
			D(j) = (points_set(:, i) - ec.M(:, j))' * (points_set(:, i) - ec.M(:, j)) ;
		end
		% ανάθεσε το σημείο στην κλάση που έχει την μικρότερη απόσταση από
		% τον μέσο της αντίστοιχης κλάσης
		[_, labels(i)] = min(D);
		
		if(mod(i, 100) == 0)
			printf("\t%d / %d points classified\n", i, n);
		end
	end
	printf("\t%d / %d points classified\n", n, n);
end
