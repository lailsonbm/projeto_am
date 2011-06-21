function [P,C,x] = parzen_window(X, C_in, k, h)
	
	d = size(X,2);
	V = h^d;
	P_js = p_priori_amostral(X, C_in);
	
	MU = medias_amostrais(X, C_in);
	SIGM = covariancias_amostrais(X, C_in);
	
	for i = 1:n
		min_Posteriori = inf;
		min_c = 0;
		
		for j = 1:k
			P_j = P_js(j);
			p_x_i_W_j = mvnpdf(X(i), MU(j), SIGM(j));
			p_i = p(X(i),X,V,h);
			
			P_W_j_x_i = (p_x_i_W_j * P_j) / p_i;
			if P_W_j_x_i < min_Posteriori
				min_c = j;
				min_Posteriori = P_W_j_x_i
			end
		end
		C(i) = 
	end

	% Função que verificar a pertinência do padrão
	% x no hipercubo centrado em x com volume h^d.
	function [f] = fi(c,x_i,h)
		x = (c-x_i)/h;
		
		d = size(x_1,2);

		for i = 1:d
			if x(i) <= 1/2
				f = 1;
				return;
			end
		end

		f = 0;
		return
	end
	
	% Função que calcula a estimativa da função de 
	% distribuição de probabilidade de x, dado o
	% conjunto de padrões X, com uma janela de volume
	% V e arestas do hipercubo h.	
	function [p_x] = p(x, X, V, h)
		n = size(X,1);
		
		for i = 1:n
			1/V * fi(x, X(i), h)
		end
	end
end