function partition = points_partition(Training_Points, Training_Points_Labels, partition_size)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Διαμερίζει το σύνολο των σημείων σε partition_size
% σύνολα, με όσο το δυνατόν πιο ομοιόμορφα κατανεμημένο
% τρόπο· με την έννοια ότι κάθε σύνολο θα περιέχει
% περίπου τον ίδιο αριθμό σημείων από κάθε κλάση.
%
% Κάθε σύνολο της διαμέρισης θα αποθηκεύεται σε μια δομή
% που θα έχει ως στοιχεία:
%	i)	 Ένα μητρώο με τα σημεία του συνόλου
%
%	ii)	 Ένα παράλληλο μητρώο με την ετικέτα της κλάσης
%		 του αντίστοιχου σημείου του μητρώου (i)
%
% Το σύνολο των δομών κρατόνται σε ένα cell, το οποίο και
% επιστρέφεται.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	n_classes = get_num_of_classes(Training_Points_Labels);
	pss = init_partition_struct(Training_Points_Labels);
	

	% δημιουργούμε ένα μητρώο D, dim(D) = n_classes x partition_size,
	% όπου D(i, j) = ο μέγιστος # σημείων από την i κλάση που πρέπει να
	% έχει το σύνολο της διάμερισης j 
	D = zeros(n_classes, partition_size);
	for i = 1:n_classes
		for j = 1:partition_size
			D(i, j) = pss{i}.n_available / partition_size;
		end
	end
	
	
	
	partition = cell(1, partition_size);
	for i = 1:partition_size
		partition{i} = struct("points", [], "points_labels", []);
	end
	
	for i = 1:partition_size
		for j = 1:n_classes
			while( and( (pss{j}).n > 0 , D(i, j) > 0 ) )
				p = pick_point_randomly(pss, j, Training_Points);
				(partition{i}).points = [(partition{i}).points p];
				(partition{i}).points_labels = [(partition{i}).points_labels j];
				
				D(i, j) = D(i, j) - 1;
			end
		end
	end
end
