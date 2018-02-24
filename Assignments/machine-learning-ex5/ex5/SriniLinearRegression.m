function [J, grad] = SriniLinearRegression(X, y, initialTheta, lambda)

X = [ones(rows(X), 1) X];
h = initialTheta * X'; %%%% 1x2 2xX = 1xX

h = h'; %%%% Xx1

J = (1/(rows(X) * 2)) * sum ((h - y) .^ 2)  +  (lambda/(rows(X) * 2)) * sum (initialTheta(:,2:end) .^2);

grad = (1/rows(X)) * ((h - y)' * X); %% 1x12 12x2 = 1x2
grad = grad + (lambda / rows(X)) .* ([0 initialTheta(:,2:end)]);

endfunction
