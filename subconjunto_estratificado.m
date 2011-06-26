%  k   - número do conjunto k-fold
%  n   - número total de conjuntos
% Ts   - conjunto de teste
% Tr   - conjunto de treinamento
% C_tr - classes do conjunto de treinamento
% C_tr - classes do conjunto de teste
function [Tr Ts C_tr C_ts] = subconjunto_estratificado(k, n, varargin)
  if(k > n)
    error('k nao pode ser maior que n.');
  end
  
  d = size(varargin{1}, 2);
  c = size(varargin, 2);
  N = zeros(k, 1);
  for i = 1:c
    N(i) = size(varargin{i}, 1);
  end
  
  n_ts = sum(N/n);
  n_tr = sum(N) - n_ts;
  
  Tr   = zeros(n_tr, d);
  Ts   = zeros(n_ts, d);
  C_tr = zeros(n_tr, 1);
  C_ts = zeros(n_ts, 1);
  
  i_tr = 1;
  i_ts = 1;
  for i = 1:c
    X = varargin{i};
    
    qtd = N(i)/n;
    inicio = (k-1)*qtd + 1;
    fim = inicio + qtd - 1;
    
    fim_ts = i_ts + qtd - 1;
    Ts(i_ts:fim_ts, :) = X(inicio:fim, :);
    C_ts(i_ts:fim_ts) = repmat(i, fim_ts-i_ts+1, 1);
    i_ts = fim_ts + 1;
    
    fim_tr = i_tr + N(i) - qtd - 1;
    X(inicio:fim, :) = [];
    Tr(i_tr:fim_tr, :) = X;
    C_tr(i_tr:fim_tr) = repmat(i, fim_tr-i_tr+1, 1);
    i_tr = fim_tr + 1;
  end
end