load('ex4data1.mat');
load('ex4weights.mat');

X = [ones(rows(X), 1) X];
%size(X) 5000x401
%size(Theta1) 25x401
%size(Theta2) 10x26
size(y)
cost = 0;

for i = 1:rows(X)
	l2 = Theta1 * X(i, :)'; %%% 25x1;
	l2 = (1 ./ (1 + exp(-1 .* l2)));
	l2 = [1; l2];

	l3 = Theta2 * l2; %%% (10x26) * (26x1) = 10x1
	l3 = (1 ./ (1 + exp(-1 .* l3))); %%% 10x1

	
	yMat = zeros(10, 1); % 10x1
	yMat(y(i)) = 1; 

	cost = cost + ( ((-1 * yMat)' * ( log(l3))) - ((1 - yMat)' * (log(1 - l3)))) % 1x10 * 10x1


	sumTheta = sum(sum(Theta1.^2)) + sum(sum(Theta2.^2));
endfor

finalCost = (1/rows(X)) * (cost)
lambda = 1
rCost = finalCost + (lambda/(2*rows(X))) * (sumTheta)


