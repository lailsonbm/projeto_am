n1 = 150;
n2 = 100;
n3 =  50;
n  = n1 + n2 + n3;

X1 = mvnrnd([0 0], [4.00  1.70 ;  1.70 1.00], n1);
X2 = mvnrnd([0 3], [0.25  0.00 ;  0.00 0.25], n2);
X3 = mvnrnd([4 3], [4.00 -1.70 ; -1.70 1.00], n3);
X  = [X1 ; X2 ; X3]; % 300 x 2
A  = [ones(n1,1) ; 2*ones(n2,1) ; 3*ones(n3,1)]; % Classe real dos padrões

save dados.mat;