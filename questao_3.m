% ----------------------------
% CARREGANDO DADOS E CLUSTER
% ----------------------------
carregar_dados;
carregar_cluster;

% ----------------------------
% VALIDAÇÃO K-FOLDS
% ----------------------------
n_conjuntos = 10;
err_DA = zeros(n_conjuntos, 1); % taxas de erro de discriminante amostral
err_PW_k1_1 = zeros(n_conjuntos, 1); % taxas de erro de janelas de parzen
err_PW_k1_2 = zeros(n_conjuntos, 1); % taxas de erro de janelas de parzen
err_PW_k2_1 = zeros(n_conjuntos, 1); % taxas de erro de janelas de parzen
err_PW_k2_2 = zeros(n_conjuntos, 1); % taxas de erro de janelas de parzen

err_soma_k1_1_k1_2 = zeros(n_conjuntos, 1);
err_soma_k1_1_k2_1 = zeros(n_conjuntos, 1);
err_soma_k1_1_k2_2 = zeros(n_conjuntos, 1);
err_soma_k2_1_k2_2 = zeros(n_conjuntos, 1);

err_produto_k1_1_k1_2 = zeros(n_conjuntos, 1);
err_produto_k1_1_k2_1 = zeros(n_conjuntos, 1);
err_produto_k1_1_k2_2 = zeros(n_conjuntos, 1);
err_produto_k2_1_k2_2 = zeros(n_conjuntos, 1);

part = cvpartition(C_eq, 'kfold', n_conjuntos);

for i = 1:n_conjuntos
  [Tr Ts C_tr C_ts] = subconjunto_estratificado(X, C_eq, i, part);
  
  disp(sprintf('FOLD %d/%d', i, n_conjuntos));
  
  disp('DA');
  [C_da Pb_da] = da_classificador(Ts, Tr, C_tr);
  err_DA(i) = imprimir_taxa_erro(C_da, C_ts);
  
  disp('PW (k=1, h=5)');
  
  disp('PW (k=1, h=10)');
  
  % TODO Fazer outros
end

disp('ERRO MEDIO');
disp(sprintf('[DA]: %6.2f', mean(err_DA)*100));