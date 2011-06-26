function [t] = imprimir_taxa_erro(C, A)
  t = taxa_erro(C, A);
  disp(sprintf('Taxa de erro:      %6.2f%%', t*100));
  disp(char(10));
end