% ----------------------------
% GERANDO DADOS
% ----------------------------
carregar_dados;


% ----------------------------
% PR�-PROCESSAMENTO
% ----------------------------

% Computando matriz (triangular) de dissimilaridades
D = zeros(n);
for i = 1:n
  for j = i:n
    D(i,j) = distancia(X(i,:), X(j,:));
  end
end

% Refletindo as distancias iguais na matriz
for i = 1:n
  for j = 1:i
    D(i,j) = D(j,i);
  end
end


% ----------------------------
% EXPERIMENTOS (n = 100)
% ----------------------------
min_J = Inf;
for i = 1:100
  [P,C,x] = dynamic_cloud(X,D,3);
  
  if x < min_J
    min_J = x;
    min_P = P;
    min_C = C;
  end
  
  disp(sprintf('J = %.2f', x));
end
disp(sprintf('J_min = %.2f', min_J));
min_P


% ----------------------------
% AVALIA��O
% ----------------------------
% TODO Substituir por matriz de confus�o
[t_g, T_k, C_eq] = avaliar_cluster(C, A);
disp(sprintf('Taxa de erro global: %.2f%%', t_g*100));
for i = 1:size(T_k, 1)
  disp(sprintf('Taxa de erro da classe %d: %.2f%%', i, T_k(i)*100));
end


% ----------------------------
% PLOT
% ----------------------------
plot_cluster(X, A);
figure;
plot_cluster(X, C_eq, P);