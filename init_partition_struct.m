function pss = init_partition_struct(Training_Points_Labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Αρχικοποιούμε μια δομή για κάθε κλάση που κρατάει:
% 	i) 	 τον αριθμό των στοιχείων της συγκεκριμένης κλάσης
%		 στο μητρώο Training_Points
%
%	ii)	 ένα διάνυσμα με τις θέσεις των σημείων που ανήκουν
%		 στη συγκεκριμένη κλάση
%
%	iii) ένα λογικό διάνυσμα αρχικοποιημένο σε false
%		 παράλληλο του διανύσματος (ii) για το εάν το
%		 συγκεκριμένο σημείο έχει μπει σε κάποιο σύνολο της
%		 διαμέρισης.
%	
%	iv)	 τον αριθμό των διαθέσιμων σημείων
%
% Το σύνολο των δομών κρατούνται σε ένα cell, το οποίο και 
% επιστρέφεται.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	n_classes = get_num_of_classes(Training_Points_Labels);
	
	pss = cell(1, n_classes);
	for i = 1:n_classes
		pos_vector = get_pos_vector(i, Training_Points_Labels);
		pss{i} = struct("n", length(pos_vector), "pos_vector", pos_vector,
						"taken", zeros(1, length(pos_vector)), "n_available", length(pos_vector));
	end
end
