%  X   - matriz de dados
%  C   - classes
%  k   - número do conjunto k-fold
%  c   - cvpartition
% Ts   - conjunto de teste
% Tr   - conjunto de treinamento
% C_tr - classes do conjunto de treinamento
% C_ts - classes do conjunto de teste
function [Tr Ts C_tr C_ts] = subconjunto_estratificado(X, C, k, c)
  if(k > c.NumTestSets)
    error('k nao pode ser maior que o número de conjuntos.');
  end
  
  TrIndices = find(c.training(k));
  TsIndices = find(c.test(k));
  
  Tr = X(TrIndices, :);
  Ts = X(TsIndices, :);
  C_tr = C(TrIndices);
  C_ts = C(TsIndices);
end