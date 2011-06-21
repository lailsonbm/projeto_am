function [posteriori] = parzen_window(x_i, X, K, h, j)
	
	n = size(X,1);

	soma = 0;
	for i = 1:n
		x = X(i,:);

		soma = soma + (1/h) * K(x, x_i, h, j);
	end
	posteriori = 1/soma;	
	
	return;
end