function [P,C,x] = dynamic_cloud(X, D, k)

  n = size(X, 1);
  C = zeros(n, 1);

  % ----------------------------
  % INICIALIZAÇÃO
  % ----------------------------

  % Selecionando protótipos P_j para cluster C_j. A escolha
  % dos protótipos é feita aleatoriamente a partir do conjunto
  % X de padrões.
  P = zeros(k,1);
  for j = 1:k
    % P armazena apenas os índices dos protótipos
    p_candidate = randi(n);
    % Evitando que protótipos repetidos sejam selecionados
    while find(P==p_candidate)
      p_candidate = randi(n);
    end
    P(j) = p_candidate;
  end

  % Afetando cada padrão X_i ao cluster C_j cujo protótipo
  % P_j é o mais próximo de X_i.
  for i = 1:n
    min_c = 0;
    min_dist = Inf;
    
    for j = 1:k
      p_dist = D(i, P(j));
      if p_dist < min_dist
        min_c = j;
        min_dist = p_dist;
      end
    end

    C(i) = min_c;
  end


  % ----------------------------
  % LOOP PRINCIPAL
  % ----------------------------
  
  old_x = Inf;
  x = J(P, C, D);
  C_old = [];
  while ~isequal(C, C_old)
    old_x = x;
    C_old = C;

    % ETAPA DE REPRESENTAÇÃO: Calculando os novos protótipos P_j
    % para cada cluster C_j que apresente mínimo da soma das distâncias
    % entre ele e os padrões de C_j.
    for j = 1:k
      min_soma = Inf;
      min_p = 0;
      
      C_j = find(C==j);
      for p_i = 1:size(C_j,1)
        soma_i = 0;
        for p_j = 1:size(C_j,1)
          soma_i = soma_i + D(C_j(p_i), C_j(p_j));
        end
        
        if soma_i < min_soma
          min_p = C_j(p_i);
          min_soma = soma_i;
        end
      end
      
      P(j) = min_p;
    end

    % ETAPA DE ALOCAÇÃO: Afeta cada padrão X_i ao cluster C_j cujo
    % protótipo P_j é o mais próximo de X_i.
    C = zeros(n,1);
    for i = 1:n
      min_c = 0;
      min_dist = Inf;

      for j = 1:k
        p_dist = D(i,P(j));
        if p_dist < min_dist
          min_c = j;
          min_dist = p_dist;
        end
      end
      
      C(i) = min_c;
    end
    
    x = J(P,C,D);
  end
end