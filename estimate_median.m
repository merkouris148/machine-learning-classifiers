function m = estimate_median(points)
	[d, n] = size(points);
	m = zeros(d, 1);
	for i = 1:n
		m = m + points(:, i);
	end
	m = m/n;
end
