function [C Pb] = combinacao_produto_classificador(varargin)
  [n k] = size(varargin{1});

  Pb = ones(size(varargin{1}));

  for arg = varargin
	for i = 1:n
	  for j = 1:k
		Pb(i,j) = Pb(i,j) * arg{1}(i,j);
	end
  end
  
  [Pb_max, C] = max(Pb, [], 2);
end