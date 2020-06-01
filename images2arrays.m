function [pixel_array, labels_array, pos_array] = images2arrays(Labels, Pixels)
	pixel_array = []; 
	labels_array = []; 
	pos_array = []; 
	
	[p, n] = size(Labels);
	
	for i=1:p
		for j=1:n

			if(Labels(i,j)>0) %Check if the (i,j) pixel is a training pixel
				pixel_array = [pixel_array squeeze(Pixels(i,j,:))];
				labels_array = [labels_array Labels(i,j)];
				pos_array = [pos_array [i j]'];
			end

		end
	end

end
