function [S S_com] = covariancias_amostrais(X, C)
  K = sort(unique(C));
  [n d] = size(X);
  
  S = {};
  S_com = zeros(d);
  
  for k = K'
    X_k = X(find(C==k),:);
    n_k = size(X_k, 1);
    
    S{k} = cov(X_k);
    S_com = S_com + (n_k - 1)*S{k};
  end
  
  S_com = S_com/(n-size(K, 1));
end