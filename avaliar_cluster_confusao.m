% t_g - taxa de classificação global
% T_k - taxa de classificação por classe
% G_eq - grupos equivalentes aos clusters (G_eq(1) é o cluster equivalente ao grupo 1)
function [t_g T_k C_eq] = avaliar_cluster_confusao(C, A)
  k = size(unique(C), 1);
  
  if k ~= size(unique(A), 1)
    error 'O número de classes em C deve ser igual ao número de classes em A.'
  end
  
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
  
  T_k = zeros(k);  
  T_k(1,1) = sum(C_eq_1==1)/150;
  T_k(1,2) = sum(C_eq_1==2)/150;
  T_k(1,3) = sum(C_eq_1==3)/150;
  T_k(2,1) = sum(C_eq_2==1)/100;
  T_k(2,2) = sum(C_eq_2==2)/100;
  T_k(2,3) = sum(C_eq_2==3)/100;
  T_k(3,1) = sum(C_eq_3==1)/50;
  T_k(3,2) = sum(C_eq_3==2)/50;
  T_k(3,3) = sum(C_eq_3==3)/50;
  
  t_g = sum(A~=C_eq)/300;
end