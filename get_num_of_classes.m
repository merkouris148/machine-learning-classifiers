function num_of_classes = get_num_of_classes(Train_Point_Labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function num_of_classes = get_num_of_classes(Train_Point_Labels)
% 
% A simple function calculating the number of classes, appear in
% a Train_Points_Labels vector.
%
% Arguments:
% Train_Point_Labels:
%	A 1 x n matrix, where n is the number of points. Containing
%	the labels of each point.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[d, num_of_points] = size(Train_Point_Labels);
	
	classes = [];
	num_of_classes = 0;
	for i = 1:num_of_points
		class = Train_Point_Labels(i);
		if(not(any(classes == class)))
			classes = [classes class];
			num_of_classes = num_of_classes + 1;
		end
	end
end
