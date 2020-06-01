function nbc = naive_bayes_classifier(Train_Points, Train_Points_Labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function nbc = naive_bayes_classifier(Train_Points, Train_Points_Labels)
%
% Constructor of a naive Baye's classifier.
% Arguments:
% Train_Points:
%	A d x n matrix, where n is the number of points and d the
%	dimension.
%
% Train_Points_Labels:
%	A 1 x n matrix, where n is the number of points. Containing
%	the labels of each point.
%
% The constructor estimates the median of the pdf of each
% class, assuming that the classes follow a normal
% distribution for some median m and variance 1.
%
% Data Members:
%	n_classes	: number of classes
%	d			: dimension of points
%	M			: The median matrix, dim(M) = d x n_classes.
%	V			: The variability matrix, dim(V) = d x n_classes
%	a_priori	: A 1 x n_classes vectror of the a priori probability of each
%					class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[nbc.d, n] = size(Train_Points);
	
	% έχει γίνει η σύμβαση ότι οι ετικέτες των κλάσεων είναι {1, ..., n_classes}
	nbc.n_classes = get_num_of_classes(Train_Points_Labels);
	
	nbc.a_priori = zeros(1, nbc.n_classes);
	for i = 1:nbc.n_classes
		nbc.a_priori(i) = sum(Train_Points_Labels == i)/n;
	end
	
	
	nbc.M = zeros(nbc.d, nbc.n_classes);
	nbc.V = zeros(nbc.d, nbc.n_classes);
	for i = 1:nbc.n_classes
		P = points_of_class(Train_Points, Train_Points_Labels, i);
		for j = 1:nbc.d
			nbc.M(j, i) = estimate_median(P(j, :));
			nbc.V(j, i) = estimate_variance(P(j, :), nbc.M(j, i));
		end
	end
	
	nbc = class(nbc, "naive_bayes_classifier");
end

	
	
	
	
