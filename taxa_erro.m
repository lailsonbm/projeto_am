% C - classes do classificador
% A - classes reais
function [t] = taxa_erro(C, A)
  if(size(C,1) ~= size(A,1))
    error('C e A devem ter o mesmo tamanho.');
  end
  
  n = size(C, 1);
  t = size(find(C~=A), 1)/n;
end