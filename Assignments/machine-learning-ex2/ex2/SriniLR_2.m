dat = load('ex2data2.txt');


x = dat(:, [1,2])
y= dat(:, 3)

pos = find(y==1)
neg = find(y==0)

figure; hold on;

plot(x(pos, 1), x(pos, 2), '+', 'color', 'r')
plot(x(neg, 1), x(neg, 2), 'o', 'color', 'b')


x = mapFeature(x(:,1), x(:,2));

options = optimset('GradObj', 'on', 'MaxIter', 400);
initial_theta = zeros(columns(x), 1)
[optTheta, cost] = fminunc(@(t)(costFunction_reg_1(t, x, y, -1)), initial_theta, options)


n = linspace(-1.2, 1.5, 50);
m = linspace(-1.2, 1.5, 50);

for i = 1:length(n)
	for j = 1:length(m)
		z(i,j) = mapFeature(n(i), m(j)) * optTheta;
	endfor
endfor

z = z';

z = round(1 ./ (1 + exp(-1 * z)))

[c,h] = contour(n, m, z, [1 1]);
#surf(n,m,z)
clabel(c,h)
