function P_priori = p_priori_amostral(X, C)
  K = sort(unique(C));
  P_priori = zeros(size(K));
  n = size(C, 1);
  
  for k = K'
    n_k = size(find(C==k), 1);
    P_priori(k) = n_k/n;
  end
end