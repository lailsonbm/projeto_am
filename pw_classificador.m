function [C] = pw_classificador(X, X_train, C_train, kernel, h, k)
	
	n = size(X,1);
	if kernel == 'normal'
		MU = medias_amostrais(X_train, C_train);
		SIGM = covariancias_amostrais(X_train, C_train);

		K = @(c,x,h) mvnpdf((c-x)/h, MU, SIGM);
	else		
		K = @(c,x,h) janela(c,x,h);
	end	
	
	C = zeros(n,1);
	
	for i = 1:n
		min_posteriori = inf;
		min_c = 0;
		
		for j = 1:k
			x_i = X(i);
			Xs = X_train(find(C_train == j));
			posteriori = parzen_window(x_i, Xs, K, h);
			if posteriori < min_posteriori
				min_c = j;
				min_posteriori = posteriori;
			end
		end
		
		C(i) = min_c;
	end

	function [f] = janela(c,x_i,h)
		x = (c-x_i)/h;
		
		d = size(c,2);

		for i = 1:d
			if x(i) <= 1/2
				f = 1;
				return;
			end
		end

		f = 0;
		return;
	end
end