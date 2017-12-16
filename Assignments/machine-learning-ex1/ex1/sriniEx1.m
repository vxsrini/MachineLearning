rd = load('ex1data1.txt'); 

x = rd(:, 1);
y = rd (:, 2);

plot(x,y, '*', 'MarkerSize', 10)
xlabel('Population in 10000s')
ylabel('profit in 10000s')

initialTheta = zeros(columns(rd),1);
concatMatrix = [ones(rows(x), 1) x];

J = sum((concatMatrix * initialTheta - y).^2) / (2 * rows(x))

oldTheta = initialTheta;
newTheta = initialTheta;
alpha = .01; 
count = 0;
do 
	count++;
	oldTheta = newTheta;
	nt = concatMatrix * oldTheta;
	nt_1 = nt - y;
	for i = [1:columns(rd)]
		nt_2 = concatMatrix(:, i)' * nt_1; 
		newTheta(i) = oldTheta(i) -((alpha / rows(x)) * nt_2);
	endfor
until (sum((newTheta - oldTheta) < .00001*ones(rows(oldTheta), 1)) == 2) 

normalTheta = (inv(concatMatrix' * concatMatrix)) * concatMatrix' * y
gapx = ceil(abs(newTheta(1)));
gapy = ceil(abs(newTheta(2))); 
tx = linspace(newTheta(1) - gapx, newTheta(1) + gapx, 100);
ty = linspace(newTheta(2) - gapx, newTheta(2) + gapx, 100);
%tx = linspace(-10, 10, 100);
%ty = linspace(-1, 4, 100);

jz = zeros(length(tx), length(ty));

for i = [1:length(tx)]
	for j = [1:length(ty)]
		jz(i, j) = sum(((concatMatrix * [tx(i);ty(j)]) - y).^2) / (2 * rows(x));
	endfor
endfor

surf(tx, ty, jz)
