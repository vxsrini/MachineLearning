dat = load('ex2data1.txt');


x = dat(:, [1,2])
y= dat(:, 3)

pos = find(y==1)
neg = find(y==0)

figure; hold on;

#plot(x(pos, 1), x(pos, 2), '+')
#plot(x(neg, 1), x(neg, 2), 'o')

X = x;
X = [ones(rows(x), 1), x]

options = optimset('GradObj', 'on', 'MaxIter', 400);
initial_theta = zeros(columns(X), 1)
%[optTheta, cost] = fminunc(@(t)(costFunction_1(t, X, y)), initial_theta, options)
[optTheta, cost] = fminunc(@(initial_theta)(costFunction_1(initial_theta, X, y)), initial_theta, options)

u = linspace(1, 100, 100);
v = linspace(1, 100, 100);

for i = 1:length(u)
	for j = 1:length(v)
		z(i, j) = optTheta' * [1 u(i) v(j)]';
	endfor
endfor
z = z';
z = round(1 ./ (1 + exp(-1 * z)));
z
#[c, h] = contour(u, v, z, [0,1]);
#clabel(c, h);
surf(u, v, z)
