function p = calculate_performance(classifier, Points, Points_Labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function p = calculate_performance(classifier, Points, Point_Labels)
% 
% This function calculates the performace of a classifier, namely
% Per = ( # correctly classified points ) / ( # points ). To do
% that first classifies the Points, then calculates the two number
% mentioned above.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	classifiers_labels = classify(classifier, Points);
	
	n_correctly_classified_points = sum(classifiers_labels == Points_Labels);
	
	p = n_correctly_classified_points / length(Points_Labels);
end



