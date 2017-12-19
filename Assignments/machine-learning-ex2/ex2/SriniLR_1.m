dat = load('ex2data1.txt');


x = dat(:, [1,2])
y= dat(:, 3)

pos = find(y==1)
neg = find(y==0)

figure; hold on;

plot(x(pos, 1), x(pos, 2), '+')
plot(x(neg, 1), x(neg, 2), 'o')

X = x;
X = [ones(rows(x), 1), x]


if (1 == 2)
	newTheta = oldTheta = zeros(columns(dat), 1)
	z = h = j = 0;
	diffVector = []
	alpha = .01;
	count = 1;
	lambda = [0,0,0;0,1,0;0,0,1]
	while(1 == 2)
	finalTheta = ((inv(x'* x) - (1000 * lambda)) * x' * y)
	do
		count++;
		oldTheta = newTheta
		for i = [1:rows(x)]
			z = oldTheta' * x(i, :)';
			h = (1 / (1+exp(-1 * z)));
			diffVector = [diffVector; (h - y(i))];
			j = j + ((-1 * y(i) * log(h)) - ((1 - y(i)) * log(1-h)));
			cost = j / rows(x);
		endfor
	
		for j = [1:rows(oldTheta)]
			newTheta(j) = oldTheta(j) - ((alpha / rows(x)) * (diffVector' * x(:, j)));
		endfor
		diffVector = [];
	until(sum((newTheta - oldTheta) < .00001*ones(rows(oldTheta), 1)) == columns(dat))
	endwhile
endif

options = optimset('GradObj', 'on', 'MaxIter', 400);
initial_theta = zeros(columns(X), 1)
[optTheta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options)

