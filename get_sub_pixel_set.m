function sub_pixel_set = get_sub_pixel_set(pixel_set, mask)
	[p, n, l] = size(pixel_set);
	sub_pixel_set = zeros(p,n,l); 
	for i = 1:l
		sub_pixel_set(:,:,i) = pixel_set(:,:,i) .* (mask > 0);
	end
end
