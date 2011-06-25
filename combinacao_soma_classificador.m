function [C Pb] = combinacao_soma_classificador(varargin)
  Pb = zeros(size(varargin{1}));
  for arg = varargin
    Pb = Pb + arg{1};
  end
  
  [Pb_max, C] = max(Pb, [], 2);
end