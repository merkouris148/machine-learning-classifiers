function two_partition = j_union_partition_sets(partition, j)

	two_partition = cell(1, 2);
	for i = 1:2
		two_partition{1} = struct("points", [], "points_labels", []);
	end
	
	for i = 1:length(partition)
		if(i != j)
			(two_partition{1}).points = [(two_partition{1}).points (partition{i}).points];
			(two_partition{1}).points_labels = [(two_partition{1}).points_labels (partition{i}).points_labels];
		else
			(two_partition{2}).points = (partition{i}).points;
			(two_partition{2}).points_labels = (partition{i}).points_labels;
		end
	end
end
