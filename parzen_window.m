function [Pb] = parzen_window(x_i, X_train, K, h, j)
  
  n = size(X_train, 1);

  soma = 0;
  for i = 1:n
    x = X_train(i, :);
    soma = soma + (1/h) * K(x, x_i, h, j);
  end
  Pb = (1/n) * soma; 
  
end