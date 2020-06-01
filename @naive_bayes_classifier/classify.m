function labels = classify(nbc, points_set)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function labels = classify(nbc, point_set)
%
% Arguments:
% nbc:
%	A naive bayes classifier.
%
% point_set:
%	A d x n matrix, where d is the dimension and n is the
%	number of points to be classified.
%
% Return Value:
% labels:
%	A 1 x n matrix containing the classes of points_set as
%	estimated by nbc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[_, n] = size(points_set);
	
	% κάποια μηνύματα
	printf("\nNaive Bayes Classifier: %d points will be classified\n", n);
	
	labels = zeros(1, n);
	for i = 1:n
		for j = 1:nbc.n_classes
			Pr(j) = pr_x_given_wj(points_set(:, i), nbc.M(:, j), nbc.V(:, j), nbc.a_priori(j)); 
		end
		
		
		[_, labels(i)] = max(Pr);
		
		% κάποια μηνύματα
		if(mod(i, 100) == 0)
			printf("\t%d / %d points classified\n", i, n);
		end
	
	end
	
	% κάποια μηνύματα
	printf("\t%d / %d points classified\n", n, n);
end


function pr = pr_xi_given_wj(p, m, s) % s = σ^2
	pr = 1 / sqrt(2*pi) * exp( - (p - m)^2/(2*s) );
end		


function pr = pr_x_given_wj(point, M, S, a_priori)
	[d,_] = size(M);
	
	pr = a_priori;
	for i = 1:d
		pr = pr*pr_xi_given_wj(point(i,:), M(i, :), S(i, :));
	end
end

	
			
