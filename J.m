function soma = J(P, C, D)
  soma = 0;
  k = size(P, 1);
  n = size(C, 1);
  
  for j = 1:k
    indices = find(C==j);
    for i = 1:size(indices, 1)
      soma = soma + D(P(j), indices(i));
    end
  end
  
  % for i = 1:n
  %   k_i = C(i);
  %   p_i = P(k_i);
  %   soma = soma + D(i, p_i);
  % end
end