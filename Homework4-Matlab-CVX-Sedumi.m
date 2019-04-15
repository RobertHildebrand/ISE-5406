
clc;
clear all;
close all;

% % Problem 2
cvx_begin quiet
cvx_solver sedumi
variable x21 nonnegative
variable x22 nonnegative
expression  z2

z2 = -x21 - 3* x22

minimize z2
subject to
    2* x21 + 3* x22 <= 6
    -x21 + 4* x22 <= 4
cvx_end
fprintf('x1 = %.2f, x2 = %.2f, obj  = %.2f\n', x21, x22, z2);

% % Problem 3
cvx_begin quiet
cvx_solver sedumi
variables x31 x32
expression  z3

z3 = x31^2 + 2  * x32^2

minimize z3
subject to
x31 + x32 - 2 == 0
cvx_end
fprintf('x1 = %.2f, x2 = %.2f, obj  = %.2f\n', x31, x32, z3);

% % Problem 4
cvx_begin quiet
cvx_solver sedumi
variables x41 x42
expression  z4

z4 = x41 + 2  * x42

minimize z4
subject to
x41^2 + x42^2 <= 1
cvx_end
fprintf('x1 = %.2f, x2 = %.2f, obj  = %.2f\n', x41, x42, z4);

% Problem 5
x5 = sdpvar(2,1);
Constraints = [-3 <= x5(1) <= 3, -3 <= x5(2) <= 3];
Objective = sin( x5(1))*cos(2*x5(2)) + sin(2*x5(1)*x5(2) );

options = sdpsettings('solver','ipopt');
sol = optimize(Constraints,Objective,options);


% % Problem 6
cvx_begin
cvx_solver sedumi
variable x6(2,4)
variable x6_c(2,1)
variable w(4)
expression  z

z6 = sum(w)
minimize z6

subject to
for i = 1:4
    norm(x6(:, i) - x6_c) <= w(i)
end

norm(x6(:,1) - [0;4]) <= 2
norm(x6(:,2) - [9;5]) <= 1
[6; -2] <= x6(:,3) <= [8; 2]
[1;-3] <= x6(:,4) <= [3; -1]
[-2; -3] <= x6_c <= [10; 6]

cvx_end

figure; plot(x6(1,:), x6(2, :), 'r*');
hold on;
plot(x6_c(1), x6_c(2), 'bo');

% %  Problem 7
sdpvar x7 y7 z7;
Constraints = [0 <= y7 <= 10, 0 <= 3 * x7 - y7 <= 30, ...
    z7 <= (x7-1)^2 + (y7-1)^2,...
    z7 <= (x7-3)^2 + (y7-6)^2, ...
    z7 <= (x7-7)^2 + (y7-2)^2, ...
    z7 <= (x7-8)^2 + (y7-5)^2];

Objective = -sqrt(z7);
options = sdpsettings('solver','ipopt');
sol = optimize(Constraints,Objective,options);
