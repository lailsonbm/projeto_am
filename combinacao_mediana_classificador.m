function [C Pb] = combinacao_mediana_classificador(varargin)
  [n d] = size(varargin{1});
  Pb_concat = zeros(n, d, nargin);
  for i = 1:nargin
    Pb_concat(:,:,i) = varargin{i};
  end
  Pb = median(Pb_concat, 3);
  
  [Pb_max, C] = max(Pb, [], 2);
end