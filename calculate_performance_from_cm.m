function p = calculate_performance_from_cm(confusion_matrix)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function calculates the performance of a classifier given the confusion
% matrix. Adds the elements of main diagonial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[_, n] = size(confusion_matrix);
	p = 0;
	for i = 1:n
		p = p + confusion_matrix(i, i);
	end
	n_points = sum(sum(confusion_matrix));
	p = p / n_points;
end
