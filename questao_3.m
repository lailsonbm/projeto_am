% ----------------------------
% CARREGANDO DADOS E CLUSTER
% ----------------------------
carregar_dados;
carregar_cluster;

% ----------------------------
% VALIDAÇÃO K-FOLDS
% ----------------------------
n_conjuntos = 10;
err_DA = zeros(n_conjuntos, 1);  % taxas de erro de discriminante amostral
err_PW1 = zeros(n_conjuntos, 1); % taxas de erro de janelas de parzen (kernel = normal)
err_PW2 = zeros(n_conjuntos, 1); % taxas de erro de janelas de parzen (kernel = janela)
err_CS = zeros(n_conjuntos, 1);  % taxas de erro de combinação de classificadores (soma)
err_CP = zeros(n_conjuntos, 1);  % taxas de erro de combinação de classificadores (produto)
err_CM = zeros(n_conjuntos, 1);  % taxas de erro de combinação de classificadores (mediana)

part = cvpartition(C_eq, 'kfold', n_conjuntos);

for i = 1:n_conjuntos
  [Tr Ts C_tr C_ts] = subconjunto_estratificado(X, C_eq, i, part);
  
  disp(sprintf('FOLD %d/%d', i, n_conjuntos));
  
  % avaliando discriminante amostral
  disp('DA');
  [C_da Pb_da] = da_classificador(Ts, Tr, C_tr);
  err_DA(i) = imprimir_taxa_erro(C_da, C_ts);
  
  % avaliando parzen window para kernel normal
  disp('PW (k=1, h=5)');
  [C_pw1 Pb_pw1] = pw_classificador(Ts, Tr, C_tr, 'normal');
  err_PW1(i) = imprimir_taxa_erro(C_pw1, C_ts);
  
  % avaliando parzen window para kernel janela
  disp('PW (k=2, h=5)');
  [C_pw2 Pb_pw2] = pw_classificador(Ts, Tr, C_tr, 'janela');
  err_PW2(i) = imprimir_taxa_erro(C_pw2, C_ts);

  % avaliando coambinação de classificadores utilizando o método da soma
  [C_cs Pb_cs] = combinacao_soma_classificador(Pb_da, Pb_pw1, Pb_pw2);
  err_CS(i) = imprimir_taxa_erro(C_cs, C_ts);

  % avaliando coambinação de classificadores utilizando o método do produto
  [C_cp Pb_cp] = combinacao_produto_classificador(Pb_da, Pb_pw1, Pb_pw2);
  err_CP(i) = imprimir_taxa_erro(C_cp, C_ts);

  % avaliando coambinação de classificadores utilizando o método da mediana
  [C_cm Pb_cm] = combinacao_mediana_classificador(Pb_da, Pb_pw1, Pb_pw2);
  err_CM(i) = imprimir_taxa_erro(C_cm, C_ts);
end

disp('ERRO MEDIO');
disp(sprintf('[DA]:  %6.2f +- %6.2f',  mean(err_DA)*100, std(err_DA)*100));
disp(sprintf('[PW1]: %6.2f +- %6.2f', mean(err_PW1)*100, std(err_PW1)*100));
disp(sprintf('[PW2]: %6.2f +- %6.2f', mean(err_PW2)*100, std(err_PW2)*100));
disp(sprintf('[CS]:  %6.2f +- %6.2f',  mean(err_CS)*100, std(err_CS)*100));
disp(sprintf('[CP]:  %6.2f +- %6.2f',  mean(err_CP)*100, std(err_CP)*100));
disp(sprintf('[CM]:  %6.2f +- %6.2f',  mean(err_CM)*100, std(err_CM)*100));