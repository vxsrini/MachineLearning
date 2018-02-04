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

options = optimset('GradObj', 'on', 'MaxIter', 2000);
[unRFinalTheta, jVal] = fminunc(@(t)(SriniCostFunction(t, sl, slPlus1, fSl, X, y, lambda)), unRInitTheta, options);


size(jVal)
size(unRFinalTheta)
Theta1 = reshape(unRFinalTheta(1:(sl+1)*slPlus1, :), slPlus1, sl+1);
Theta2 = reshape(unRFinalTheta((((sl+1)*slPlus1)+1):end, :), fSl, slPlus1+1);

fprintf("Main -> Size of initial finalTheta1 = [%dx%d]\n", size(Theta1));
fprintf("Main -> Size of initial finalTheta2 = [%dx%d]\n", size(Theta2));


l1 = X(3050, :) * Theta1'; %%%%% 1*401 401*25
y(3050, :)
l1 = (1 ./ (1 + exp(-1 .* l1)));
l1 = [0 l1]; %%%% 1x26
l2 = Theta2 * l1'; %%%%% 10x26 * 26*1
l2 = round(1 ./ (1 + exp(-1 .* l2)));
l2

