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
imprimir_taxa_erro(C_da, C_eq);


% ---------------------------------------------
% CLASSIFICAÇÃO COM JANELA DE PARZEN
% ---------------------------------------------
disp('Classificando com janela de Parzen...');

disp(sprintf('kernel = normal'));
[C_pw Pb_pw_i] = da_classificador(X, X, C_eq); % TODO mudar para pw
imprimir_taxa_erro(C_pw, C_eq);

disp(sprintf('kernel = janela'));
[C_pw Pb_pw_i] = da_classificador(X, X, C_eq); % TODO mudar para pw
imprimir_taxa_erro(C_pw, C_eq);

% ---------------------------------------------
% CLASSIFICAÇÃO COM SOMA
% ---------------------------------------------
% TODO


% ---------------------------------------------
% CLASSIFICAÇÃO COM PRODUTO
% ---------------------------------------------
% TODO


% ---------------------------------------------
% CLASSIFICAÇÃO COM MEDIANA
% ---------------------------------------------
% TODO