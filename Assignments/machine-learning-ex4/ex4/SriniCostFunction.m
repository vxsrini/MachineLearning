function [jVal, gradient] =  SriniCostFunction(unRInitTheta, sl, slPlus1, fSl, X, y, lambda)

	Theta1 = reshape(unRInitTheta(1:(sl+1)*slPlus1, :), slPlus1, sl+1);
	Theta2 = reshape(unRInitTheta((((sl+1)*slPlus1)+1):end, :), fSl, slPlus1+1); 

	fprintf("CostFunction -> Size of rolled Theta1 = [%dx%d]\n", size(Theta1)); 
	fprintf("CostFunction -> Size of rolled Theta2 = [%dx%d]\n", size(Theta2));
	fprintf("CostFunction -> Size of y = [%dx%d]\n", size(y)); 

	regTheta1 = [zeros(rows(Theta1), 1) Theta1(:, 2:end)];
	regTheta2 = [zeros(rows(Theta2), 1) Theta2(:, 2:end)];

	fprintf("CostFunction -> Size of regTheta1 = [%dx%d]\n", size(regTheta1));
	fprintf("CostFunction -> Size of regTheta2 = [%dx%d]\n", size(regTheta2)); 
	
	%%%% Forward propogation, compute a2, a3

	a2 = X * Theta1'; %%%% 5000x401 * 401x25 = 5000x25 
	a2 = (1 ./ (1 + exp(-1 .* a2)));
	a2 = [ones(rows(a2), 1) a2]; %%%% 5000x26

	a3 = a2 * Theta2'; %%%%% 5000x26 * 26x10  = 5000x10
	a3 = (1 ./ (1 + exp(-1 .* a3)));
	
	%%% Convert y to 10x1 vector
	yMat = zeros(5000, 10);
	for i = 1:rows(X)
		yMat(i, y(i)) = 1;	
	endfor

	%%% compute cost
	cost = sum(sum(((-1 * yMat) .* ( log(a3))) - ((1 - yMat) .* (log(1 - a3))))); %%%%  10x5000 * 5000x10
	sumTheta = sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2));
	finalCost = (1/rows(X)) * (cost)
	jVal = finalCost + (lambda/(2*rows(X))) * (sumTheta)


	
	%%%% partial derivites of jVal
	d3 = a3 - yMat; %%5000x10
	d2 = (d3 * Theta2) .* (a2 .* (1-a2)); %%%% 50000x10 * 10x26 .* 50000x26 = 5000x26
	
	del2 = (d3' * a2); %%% 10x5000 5000x26  
	del1 = (d2' * X); %%% 26x5000 5000x401

	D2 = (1/rows(X)) * (del2 + (lambda .* regTheta2));
	D1 = (1/rows(X)) * (del1(2:end,:) + (lambda .* regTheta1));

	gradient = [D1(:); D2(:)];

endfunction

