function [Labels, Pixels] = arrays2images(pixel_array, labels_array, pos_array, p, n)
	Labels = zeros(p, n);
	
	[_, _, d] = size(pixel_array);
	Pixels = zeros(p, n, d);
	
	[_, n_pixels] = size(pos_array);
	
	for i = 1:n_pixels
		Labels(pos_array(1, i), pos_array(2, i)) = labels_array(i);
		Pixels(pos_array(1, i), pos_array(2, i), :) = pixel_array(i); 
	end

end
