% ----------------------------
% CARREGANDO DADOS E CLUSTER
% ----------------------------
carregar_dados;
carregar_cluster;

% ---------------------------------------------
% CLASSIFICAÇÃO COM DISCRIMINANTES AMOSTRAIS
% ---------------------------------------------
disp('Classificando com discriminantes amostrais...');
[C_da Pb_da] = da_classificador(X, X, C_eq);
imprimir_avaliacao(C_da, C_eq);

% ---------------------------------------------
% CLASSIFICAÇÃO COM JANELA DE PARZEN
% ---------------------------------------------
disp('Classificando com janela de Parzen...');

disp(sprintf('kernel = normal'));
[C_pw1 Pb_pw1] = pw_classificador(X, X, C_eq, 'normal');
imprimir_avaliacao(C_pw1, C_eq);

disp(sprintf('kernel = janela'));
[C_pw2 Pb_pw2] = pw_classificador(X, X, C_eq, 'janela');
imprimir_avaliacao(C_pw2, C_eq);

% ---------------------------------------------
% CLASSIFICAÇÃO COM SOMA
% ---------------------------------------------
[C_cs Pb_cs] = combinacao_soma_classificador(Pb_da, Pb_pw1, Pb_pw2);
imprimir_avaliacao(C_cs, C_eq);

% ---------------------------------------------
% CLASSIFICAÇÃO COM PRODUTO
% ---------------------------------------------
[C_cp Pb_cp] = combinacao_produto_classificador(Pb_da, Pb_pw1, Pb_pw2);
imprimir_avaliacao(C_cp, C_eq);

% ---------------------------------------------
% CLASSIFICAÇÃO COM MEDIANA
% ---------------------------------------------
[C_cm Pb_cm] = combinacao_mediana_classificador(Pb_da, Pb_pw1, Pb_pw2);
imprimir_avaliacao(C_cm, C_eq);
