function s = estimate_variance(points, m)
	[d, n] = size(points);
	s = zeros(d, 1);
	for i = 1:n
		s = s + (m - points(:, i))^2;
	end
	s = s/n;
end
