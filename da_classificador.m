function [C Pb] = da_classificador(X, X_train, C_train)
  [C, err, Pb] = classify(X, X_train, C_train, 'linear', 'empirical');
end