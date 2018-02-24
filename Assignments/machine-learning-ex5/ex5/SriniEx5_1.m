load('ex5data1.mat');

plot(X,y, '*', 'MarkerSize', 10)
xlabel('Change in water level - X')
ylabel('Water flow out of the dam - y');

initialTheta = [1 1];
lambda = 1;

[J, grad] = SriniLinearRegression(X, y, initialTheta, lambda);


fprintf("/nThe cost associated with full sample wo fminunc = %f\n", J);
fprintf("The Gradient associated with full sample wo fminunc\n");
grad
fprintf("Pausing the program\n\n\n");
pause;



options = optimset('GradObj', 'on', 'MaxIter', 400);
%[optTheta, cost] = fminunc(@(t)(costFunction_1(t, X, y)), initial_theta, options)
[grad, J] = fminunc(@(initialTheta)(SriniLinearRegression(X, y, initialTheta, lambda)), initialTheta, options) ;
hold on;
plot(X, grad * [ones(size(X), 1) X]', '--', 'LineWidth', 2);
hold off;

fprintf("The cost associated with full sample after fminunc= %f\n", J);
fprintf("The Gradient associated with full sample after fminunc\n");
grad
fprintf("Pausing the program\n\n\n");
pause;


[J7Sample, grad7Sample] = SriniFminunc(X(1:7,:), y(1:7, :), initialTheta, lambda);
fprintf("The cost associated with sample with fminunc= %f\n", J7Sample);
fprintf("The Gradient associated with sample with fminunc\n");
grad7Sample
fprintf("Pausing the program\n\n\n");
pause;

J7CV = SriniLinearRegression(X(8:end, :), y(8:end, :), initialTheta, 0)

fprintf("The cost associated with cv without fminunc= %f\n", J7CV);
pause;

