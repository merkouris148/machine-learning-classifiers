function pos_vector = get_pos_vector(c, Training_Points_Labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Για την κλάση c επιστρέφεται ένα διάνυσμα με τις
% θέσεις στο Training_Points όπου έχει διανύσματα της
% κλάσης c.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	a = (Training_Points_Labels == c);
	pos_vector = [];
	for i = 1:length(a)
		if(a(i) == true)
			pos_vector = [pos_vector i];
		end
	end
end
