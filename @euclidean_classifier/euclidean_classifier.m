function ec = euclidean_classifier(Train_Points, Train_Points_Labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function ec = euclidean_classifier(Train_Points, Train_Points_Labels)
%
% Constructor of a classifier of minimum euclidean distance.
% Arguments:
% Train_Points:
%	A d x n matrix, where n is the number of points and d the
%	dimension.
%
% Train_Points_Labels:
%	A 1 x n matrix, where n is the number of points. Contains
%	the labels of each point.
%
% The constructor estimates the median of the pdf of each
% class, assuming that the classes follow a normal
% distribution for some median m and variance 1.
%
% Data Members:
%	n_classes	: number of classes
%	d			: dimension of points
%	M			: The median matrix, dim(M) =  d x n_classes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[ec.d, n] = size(Train_Points);
	
	
	ec.n_classes = get_num_of_classes(Train_Points_Labels);
	
	
	ec.M = zeros(ec.d, ec.n_classes);
	for i = 1:ec.n_classes
		P = points_of_class(Train_Points, Train_Points_Labels, i);
		ec.M(:, i) = estimate_median(P);
	end
	
	ec = class(ec, "euclidean_classifier");
end
