% ----------------------------
% CARREGANDO DADOS
% ----------------------------
carregar_dados;


% ----------------------------
% PRÉ-PROCESSAMENTO
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
% AVALIAÇÃO
% ----------------------------
% TODO Substituir por matriz de confusão
[t_g, T_k, C_eq] = avaliar_cluster(min_C, A);
imprimir_avaliacao(min_C, A);


% ----------------------------
% SALVANDO CLUSTER
% ----------------------------
save cluster.mat min_J min_P t_g T_k C_eq;


% ----------------------------
% PLOT
% ----------------------------
plot_cluster(X, A);
figure;
plot_cluster(X, C_eq, P);