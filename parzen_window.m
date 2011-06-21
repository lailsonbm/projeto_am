function [posteriori] = parzen_window(x_i, X, K, h)
	
	posteriori = 0
	n = size(X_train,1);

	soma = 0;
	for i = 1:n
		x = X(i);
		soma = soma + (1/h) * K(x, x_i, h);
	end
	posteriori = 1/soma;	
	
	return;
end