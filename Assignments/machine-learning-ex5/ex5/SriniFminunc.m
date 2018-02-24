function [J, grad] = SriniFminunc(X, y, initialTheta, lambda)
	[J, grad] = SriniLinearRegression(X, y, initialTheta, lambda);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	%[optTheta, cost] = fminunc(@(t)(costFunction_1(t, X, y)), initial_theta, options)
	[grad, J] = fminunc(@(initialTheta)(SriniLinearRegression(X, y, initialTheta, lambda)), initialTheta, options) ;
	hold on;
	plot(X, grad * [ones(size(X), 1) X]', '--', 'LineWidth', 2);
	hold off;
endfunction
