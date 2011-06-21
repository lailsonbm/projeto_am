% U - linha i representa uma classe i, coluna j representa atributo j
function U = medias_amostrais(X, C)
  K = sort(unique(C));
  U = zeros(size(K, 1), size(X, 2));
  n = size(C, 1);
  
  for k = K'
    C_k = find(C==k);
    U(k, :) = sum(X(C_k, :)) / size(C_k, 1);
  end
end