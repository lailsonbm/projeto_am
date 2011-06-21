function [] = plot_cluster(X, C, P)
  if size(X,1) ~= size(C)
    error('X and C must have the same number of lines.');
  end
  
  styles = {'*c', '+r', 'og'};
  
  clusters = unique(C);
  k = size(clusters, 1);
  for i = 1:k
    C_k = find(C==i);
    X_k = X(C_k, :);
    style = styles{rem(i-1,3) + 1};
    
    plot(X_k(:, 1), X_k(:, 2), style);
    hold on;
  end
  
  if nargin > 2
    p = size(P);
    for i = 1:p
      proto = X(P(i), :);
      plot(proto(:, 1), proto(:, 2), '.k');
    end
  end
  
  hold off;
end