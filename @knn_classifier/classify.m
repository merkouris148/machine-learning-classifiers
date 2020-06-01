function labels = classify(knnc, points_set)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function labels = classify(knnc, point_set)
%
% Arguments:
% knnc:
%	A k-nearest neighbors classifier.
%
% point_set:
%	A d x n matrix, where d is the dimension and n is the
%	number of points to be classified.
%
% Return Value:
% labels:
%	A 1 x n matrix containing the classes of points_set as
%	estimated by knnc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


	
	[d, n] = size(points_set);
	printf("\nk-Nearest Neighbors Classifier: %d points will be classified\n", n);
	labels = zeros(1, n);
	
	% για κάθε σημείο εισόδου
	for i = 1:n
		% υπολόγισε την απόσταση του σημείου από κάθε σημείο του σημειονέφους
		
		% κρατάμε στην 1 γραμμή του μητρώου D τις μικρότερες αποστάσεις και
		% στη 2η γραμμή τις ετικέτες των κλάσεων που πέτυχαν τις μικρότερες
		% αποστάσεις
		D = [inf*ones(1, knnc.k); zeros(1, knnc.k)];
		% παράλληλος πίνακς του D που περιέχει την κλάση
		E = zeros(1, knnc.k);
		for j = 1:knnc.n_points
			% d = || q - p ||^2
			d = (points_set(:, i) - knnc.points(:, j))' * (points_set(:, i) - knnc.points(:, j));
						
			for k = 1:knnc.k
				if(d < D(1, k))
					D(1, k) = d;
					D(2, k) = knnc.points_labels(j);
					break
				end
			end

		end
		labels(i) = assign_label(D, knnc.k, knnc.n_classes);
		
		if(mod(i, 100) == 0)
			printf("\t%d / %d points classified\n", i, n);
		end
	end
	
	printf("\t%d / %d points classified\n", n, n);
end



function label = assign_label(D, k, n_classes)

	votes = zeros(1, n_classes);
	for i = 1:n_classes
		votes(i) = sum(D(2, :) == i);
	end
	
	[_, label] = max(votes);

end









