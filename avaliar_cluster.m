% t_g - taxa de classificação global
% T_k - taxa de classificação por classe
% G_eq - grupos equivalentes aos clusters (G_eq(1) é o cluster equivalente ao grupo 1)
function [t_g T_k C_eq] = avaliar_cluster(C, A)
  if unique(C) ~= unique(A)
    error 'O número de classes em C deve ser igual ao número de classes em A.'
  end
  
  k = 3;
  
  g_1 = mode(C(  1:150));
  g_2 = mode(C(151:250));
  g_3 = mode(C(251:300));
  
  if g_1 == g_2 || g_2 == g_3 || g_3 == g_1
    error 'Não é possível fazer correspondência entre os grupos e os clusters.'
  end
  
  C_eq = C;
  C_eq(find(C==g_1)) = 1;
  C_eq(find(C==g_2)) = 2;
  C_eq(find(C==g_3)) = 3;
  
  A_1 = A(  1:150);
  A_2 = A(151:250);
  A_3 = A(251:300);
  
  C_eq_1 = C_eq(  1:150);
  C_eq_2 = C_eq(151:250);
  C_eq_3 = C_eq(251:300);
  
  t_g = sum(A~=C_eq)/300;
  T_k = [sum(A_1~=C_eq_1)/150 ; sum(A_2~=C_eq_2)/100 ; sum(A_3~=C_eq_3)/50 ];
end


% % definindo limites de elementos rotulados
% bordas = find(edge(A));
% k = size(bordas, 1) + 1; % numero de clusters
% n = size(X, 1); % numero de elementos
% limites = zeros(k, 2);
% for i = 1:k
%   if i == 1
%     inicio = 1;
%     fim = bordas(1) - 1;
%   elseif i == k
%     inicio = bordas(k-1);
%     fim = n;
%   else
%     inicio = bordas(i-1);
%     fim = bordas(i) - 1;
%   end
%   limites(i, :) = [inicio fim];
% end