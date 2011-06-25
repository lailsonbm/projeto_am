% --------------------------------------------------------
% Obtendo e preparando dados da primeira primeira questão.
% --------------------------------------------------------

X = [] % pegar os valores gerados dos dados
C = [] % considerar C devidamente avaliado pelo K-Means

X = []     % dados de test
X_train = [] % dados de treino
C_train = [] % o mesmo que a saída do K-Means (C)

MU = medias_amostrais(X_train, C_train);
SIGM = covariancias_amostrais(X_train, C_train);

n = size(X,1);
k = size(C,1);

% --------------------------------------------------------
% --------------------------------------------------------
% Gerando soluções: as soluções devem ser representadas
% como uma matriz de tamanho n x k, onde cada linha repre-
% senta a probabilidade a priori para do elemento i em X
% condicionada à classe j.

% --------------------------------------------------------
% Gerando solução utilizando o discriminante amostral
% de matrizes de covariâncias.
% --------------------------------------------------------

% TODO ...

% --------------------------------------------------------
% Gerando solução utilizando o método da Janela de Parzen.
% --------------------------------------------------------
kernels = ['normal', 'janela'];
h = 5;

% variando a função de kernel para o parzen window.
for kernel = kernels
  
  n = size(X,1);
  if kernel == 'normal'
    K = @(c,x,h,j) mvnpdf((c-x)/h, MU(j), SIGM{j});
  else    
    K = @(c,x,h,j) janela(c,x,h);
  end
  
  for j = 1:k
    for i = 1:n
      x_i = X(i,:);
      Xs = X_train(find(C_train == j),:);
      S_Parzen(kernek, i,j) = parzen_window(x_i, Xs, K, h, j); % NILSON... ajuda aqui!!! no S_Parzen, a ideia é ter uma matriz solução para cada tipo de kernel...
    end
  end
end