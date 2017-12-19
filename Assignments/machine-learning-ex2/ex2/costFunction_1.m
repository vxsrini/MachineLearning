function [jVal, gradient] =  costFunction_1(theta1, X, y)

	h = (1 ./ (1 + exp(-1 * X * theta1)));  
	jVal = (-1/rows(X)) * ((y' * log(h)) + ((1-y)' * log(1 - h)));
	gradient = zeros(rows(X), 1);
	gradient = (1/rows(X)) * (X' * (h - y));

endfunction
