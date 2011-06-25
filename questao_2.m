% ----------------------------
% CARREGANDO DADOS E CLUSTER
% ----------------------------
carregar_dados;
carregar_cluster;

% ---------------------------------------------
% PARAMETROS
% ---------------------------------------------
H = [1, 2]; % TODO Mudar valores
Kernels = {'normal', 'janela'};


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
for kernel = Kernels
  for h = H
    disp(sprintf('kernel = %s', kernel{1}));
    disp(sprintf('h = %d', h));
    [C_pw Pb_pw] = da_classificador(X, X, C_eq); % TODO mudar para pw
    imprimir_avaliacao(C_pw, C_eq);
  end
end