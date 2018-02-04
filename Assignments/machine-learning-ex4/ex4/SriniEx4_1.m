load('ex4data1.mat');
load('ex4weights.mat');

X = [ones(rows(X), 1) X];
%size(X) 5000x401
%size(Theta1) 25x401
%size(Theta2) 10x26
size(y)

cost = 0;
sl = 400;
slPlus1 = 25;
fSl = 10;
lambda = 1;
INIT_EPSILON = 0.11868;

initialTheta1 = rand(slPlus1, sl + 1)*(2*INIT_EPSILON) - INIT_EPSILON;
initialTheta2 = rand(fSl, slPlus1 + 1)*(2*INIT_EPSILON) - INIT_EPSILON;

fprintf("Main -> Size of initial Theta1 = [%dx%d]\n", size(initialTheta1));
fprintf("Main -> Size of initial Theta2 = [%dx%d]\n", size(initialTheta2));

fprintf("Main -> Size of initial initialTheta1 = [%dx%d]\n", size(initialTheta1(:)));

unRInitTheta = [initialTheta1(:); initialTheta2(:)];
fprintf("Main -> Size of unRInitTheta = [%dx%d]\n", size(unRInitTheta(:)));

options = optimset('GradObj', 'on', 'MaxIter', 400);
[jVal, unRFinalTheta] = fminunc(@(t)(SriniCostFunction(t, sl, slPlus1, fSl, X, y, lambda)), unRInitTheta, options);

%[jVal, unRFinalTheta] = fminunc((@p)(SriniCostFunction(p, sl, slPlus1, fSl, X, y, lambda)), unRInitTheta, options);

%jVal;
