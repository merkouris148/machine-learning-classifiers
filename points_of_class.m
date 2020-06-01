function pc = points_of_class(points, points_labels, c)
	pc = [];
	[_, n] = size(points);
	for i = 1:n
		if(points_labels(i) == c)
			pc = [pc points(:,i)];
		end
	end
end
