load('ex4data1.mat');
load('ex4weights.mat');

X = [ones(rows(X), 1) X];
%size(X) 5000x401
%size(Theta1) 25x401
%size(Theta2) 10x26
size(y)
cost = 0;


l2 = X * Theta1' ; %% 5000x401 401x25
l2 = (1 ./ (1 + exp(-1 .* l2))); %% 5000x25
l2 = [ones(rows(X), 1) l2]; %%% 5000x26
l3 = l2 * Theta2'; %%%% 5000x26 26x10
l3 = (1 ./ (1 + exp(-1 .* l3))); %% 5000x26

yMat = zeros(5000, 10);
for i = 1:rows(X)
	yMat(i, y(i)) = 1;
endfor

%%% compute cost
cost = sum(sum(((-1 * yMat) .* ( log(l3))) - ((1 - yMat) .* (log(1 - l3))))); %%%%  5000x10 .* 5000x10
sumTheta = sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2));
finalCost = (1/rows(X)) * (cost);
finalCost
jVal = finalCost + (1/(2*rows(X))) * (sumTheta)

