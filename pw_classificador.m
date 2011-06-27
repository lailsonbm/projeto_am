function [C Pb] = pw_classificador(X, X_train, C_train, kernel)
	
	k = 3;
	n = size(X,1);
	h = 3;
	
	%MU = medias_amostrais(X_train, C_train);
	%SIGM = covariancias_amostrais(X_train, C_train);
	P = p_priori_amostral(X_train, C_train);
	
	for i = 1:n
		x = X(i, :);
		
		for j = 1:k
			soma = 0;
			
			train = X_train(find(C_train == j), :);
			n_train = size(train,1);
			
			for i_train = 1:n_train
				x_i = train(i_train, :);
				c = (x - x_i)/h;
				
				if kernel == 'normal'
					m_train = (train - repmat(x_i,n_train,1))/h;
					MU_j = mean(m_train);
					SIGM_j = cov(m_train);
					soma  = soma + (1/h) * mvnpdf(c, MU_j, SIGM_j);
				else
					soma = soma + (1/h) * janela(c);
				end
				
			end
						
			Pb(i,j) = (1/n) * soma;
			
		end
	end
  
	% classificando cada padrão em X de acordo com a probabilidade
	% a posteriori em cada classe.
	for i = 1:n
		p_max = 0;
		c_max = 0;
		
		for j = 1:k
			p = Pb(i,j) * P(j);
			
			if p > p_max
				p_max = p;
				c_max = j;
			end
		end
		
		C(i,1) = c_max;
	end
	 	
	function [f] = janela(x_f)
		d = size(x_f,2);
		
		f = 1;
		for i_f = 1:d
			if abs(x_f(i_f)) > 1/2
				f = 0;
				break;
			end
		end
		
		return;
	end
end