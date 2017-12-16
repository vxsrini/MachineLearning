rd = load('ex1data2.txt'); 

x = rd(:, 1);
x2 = rd(:, 2);
y = rd (:, 3);

plot3(x, x2, y, "rx", "MarkerSize", 10);
initialTheta = zeros(columns(rd),1)

x_norm = [x x2];
x_norm = (x_norm - mean(x_norm))./ (max(x_norm) - min(x_norm))
concatMatrix = [ones(rows(x), 1) x_norm]

J = sum((concatMatrix * initialTheta - y).^2) / (2 * rows(x))

oldTheta = initialTheta;
newTheta = initialTheta;
alpha = .01;
count = 0;
do 
	count++
	oldTheta = newTheta
	nt = concatMatrix * oldTheta;
	nt_1 = nt - y;
	for i = [1:columns(rd)]
		nt_2 = concatMatrix(:, i)' * nt_1; 
		newTheta(i) = oldTheta(i) -((alpha / rows(x)) * nt_2);
	endfor
until (sum((newTheta - oldTheta) < .00001*ones(rows(oldTheta), 1)) == columns(rd)) 

newTheta
normalTheta = (inv(concatMatrix' * concatMatrix)) * concatMatrix' * y
