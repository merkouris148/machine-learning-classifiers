function knnc = knn_classifier(Train_Points, Train_Points_Labels, k)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function knnc = knn_classifier(Train_Points, Train_Points_Labels, k)
%
% Constructor of a classifier of k-nearest neighbors.
% Arguments:
% Train_Points:
%	A d x n matrix, where n is the number of points and d the
%	dimension.
%
% Train_Points_Labels:
%	A 1 x n matrix, where n is the number of points. Contains
%	the labels of each point.
%
%
% Data Members:
%	n_classes		: number of classes
%	d				: dimension of points
%	points			: A point cloud.
%	n_points		: number of points
%	points_labels	: The labels of the point cloud
%	k				: The k parameter, the number of neighbors to be
%					  considered
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[knnc.d, knnc.n_points] = size(Train_Points);
	knnc.points = Train_Points;
	knnc.points_labels = Train_Points_Labels;
	knnc.n_classes = get_num_of_classes(Train_Points_Labels);
	knnc.k = k;
	
	knnc = class(knnc, "knn_classifier");
end
