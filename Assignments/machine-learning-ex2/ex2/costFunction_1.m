function [jVal, gradient] =  costFunction_1(theta1, X, y)

	theta1 
	size(X)
	size(y)
	h = (1 / (1 + exp(-1 * X * theta1)));  %%% 100X3 * 3X1 = 47 X 1
	h = h'
	jVal = (-1/rows(X)) * (y' * log(h) + (1-y)' * log(1 - h)) %%% 1X47 * 47X1
	
	gradient = zeros(rows(X), 1);
	for i = [1:columns(X)]
		gradient(i)  = X(:, i)' * (h - y)
	endfor
	
endfunction
