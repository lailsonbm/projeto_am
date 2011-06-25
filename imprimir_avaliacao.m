function [] = imprimir_avaliacao(C, A)
  [t_g, T_k] = avaliar_cluster(C, A);
  disp(sprintf('Taxa de erro global:      %6.2f%%', t_g*100));
  for i = 1:size(T_k, 1)
    disp(sprintf('Taxa de erro da classe %d: %6.2f%%', i, T_k(i)*100));
  end
  disp(char(10));
end