load('ex3data1.mat');

X = [ones(rows(X), 1), X];

finalTheta = [];
for i=1:10
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	initial_theta = zeros(columns(X), 1);
	[optTheta, cost] = fminunc(@(t)(costFunction_1(t, X, (y==i))), initial_theta, options);
	finalTheta = [finalTheta optTheta];
	cost
endfor

fprintf("\n\n");
for i=1:10
	h = X(4400, :) * finalTheta(:, i);
	prob = round(1 / (1 + exp(-1 * h)));
	fprintf("The prob that it is %d is %d\n", i, prob);
endfor
