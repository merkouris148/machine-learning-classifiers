function k = estimate_k_parameter(Training_Points, Training_Points_Labels, k_max)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function k = estimate_k_parameter(Train_Points, Train_Points_Labels, k_max)
%
% This function estimates the k parameter for the k-nearest neighbors classifier. The ks
% who will be tested belong K = {k | k in {1, ..., k_max}, k mod partition_size > 0}
%
% Arguments:
% Train_Points:
%	A d x n matrix, where n is the number of points and d the
%	dimension.
%
% Train_Points_Labels:
%	A 1 x n matrix, where n is the number of points. Containing
%	the labels of each point.
%
% k_interval:
%	The upper bound of the hyperset of the set K of ks to be tested
%	(see above).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


	% Υπολόγισε τον σύνολο των k που θα δοκιμαστούν K.
	K = [];
	partition_size = get_num_of_classes(Training_Points_Labels);
	for i = 1:k_max
		if (mod(i, 2) == 0 && mod(i, partition_size) > 0 )
			K = [K i];
		end
	end
	
	
	% αντιμετωπίζουμε από κοινού τους πίνακες Training_Points και Training_Points_Lables,
	% η παραλληλία των πινάκων πρέπει να συνεχίσει να ισχύει και στα σύνολα της διαμμέρισης
	partition = points_partition(Training_Points, Training_Points_Labels, partition_size);
	
	
	% για κάθε τιμή του k
	knncs = cell(1, length(K));
	mean_performances = zeros(1, length(K));
	printf("Testing %d k value(s) ... \n", length(K));
	for i = 1:length(K)
		printf("testing k = %d ... \n", K(i));
		% φτιάχνουμε partition_size ταξινομητές k-πλησιέστερων γειτόνων
		i_knncs = cell(1, partition_size);
		% το άθροισμα των αποδόσεων
		S = 0;
		
		printf("\tCalculating mean performance ...\n", K(i));
		for j = 1:partition_size
			% χρησιμοποιούμε όλα τα σημεία σου συνόλου εκπαίδευσης, εκτός από εκείνα
			% που ανήκουν στο j-οστό σύνολο της διαμέρισης.
			two_partition = j_union_partition_sets(partition, j);

			i_knncs(j) = knn_classifier((two_partition{1}).points, (two_partition{1}).points_labels, K(i));
					
						
			% υπολόγισε την απόδοση του i-οστού ταξινομητή

			S = S + calculate_performance(i_knncs{j}, (two_partition{2}).points, (two_partition{2}).points_labels);
			
			printf("\t\t %d / %d\n", j, partition_size);
		end
		mean_performances(i) = S / partition_size;
		printf("\tmean performance for k = %d is %d\n", K(i), S);
		printf("# k tested: %d / %d\n", i, length(K));
	end
	
	[_, k_index] = max(mean_performances);
	k = K(k_index);
	
	printf("The best value for k parameter is %d", k);
end




		
