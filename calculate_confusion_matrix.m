function confusion_matrix = calculate_confusion_matrix(classifier_labels, n_classes, given_labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function confusion_matrix = calculate_confusion_matrix(classifier, points_set, given_labels)
%
% This function evaluates the performance of a classifier, calculating the confusion
% matrix.
%
% Arguments:
% classifier_labels:
%
% given_labels:
%	A 1 x n matrix, containing the actual labels of the points set, where n is the number
%	of points. Naturally the number of labels equals the number of points in points_set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	confusion_matrix = zeros(n_classes, n_classes);
	for i = 1:n_classes
		for j = 1:n_classes
			confusion_matrix(i, j) = calculate_confusion(i, j, given_labels, classifier_labels);
		end
	end
end


function ij_confusion_cell = calculate_confusion(i, j, given_labels, classifier_labels)
	
	i_given_labels = given_labels == i;
	j_labels = classifier_labels == j;
	
	ij_confusion_vector = i_given_labels .* j_labels;
	ij_confusion_cell = sum(ij_confusion_vector);
end
	
	
	
	
	
	
	
	
	
	
