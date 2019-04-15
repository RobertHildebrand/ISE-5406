
%P2%
x = sdpvar(2,1);
Constraints = [2*x(1)+3*x(2)<=6, -x(1)+4*x(2)<=4, x(1)>=0, x(2)>=0];
Objective = -x(1)-3*x(2);
ops = sdpsettings('solver','ipopt');
optimize(Constraints, Objective, ops);
solution_2 = value(x)

%P3%
x = sdpvar(2,1);
Constraints = x(1)+x(2)-2==0;
Objective = x(1)^2+2*x(2)^2;
ops = sdpsettings('solver','ipopt');
optimize(Constraints, Objective, ops);
solution_3 = value(x)

%P4%
x = sdpvar(2,1);
Constraints = x(1)^2 + x(2)^2<=1;
Objective = x(1)+2*x(2);
ops = sdpsettings('solver','ipopt')
optimize(Constraints, Objective, ops);
solution_4 = value(x)

%P5%
sdpvar x y 
p = sin(x)*cos(2*y)+sin(2*x*y);
optimize([-3 <= [x y] <= 3],p,sdpsettings('solver','ipopt'));
solution_5 = value([x y p])

%P6%
w=sdpvar(4,1);
x=sdpvar(5,1);
y=sdpvar(5,1);
Constraints =[];
for i=2:5
   Constraints = [Constraints, (x(1)-x(i))^2+(y(1)-y(i))^2<=w(i-1)^2, w(i-1)>=0, -4<=x(i)<=12, -4<=y(i)<=8]; 
end
Constraints = [Constraints, -4<=x(1)<=12, -4<=y(1)<=8, x(2)^2+(y(2)-4)^2<=4, (x(3)-9)^2+(y(3)-5)^2<=1, 6<=x(4)<=8, -2<=y(4)<=2, 1<=x(5)<=3, -3<=y(5)<=-1];
Objective = sum(w);
ops = sdpsettings('solver','ipopt')
optimize(Constraints,Objective,ops)
solution_6 = value([x y])

%P7%
a = [1 3 7 8];
b = [1 6 2 5];
sdpvar x y z
Constraints = [0<=y<=10, 0<=3*x-y<=30];
for i=1:4
    Constraints = [Constraints, (x-a(i))^2+(y-b(i))^2>=z];
end
Objective = -z;
ops = sdpsettings('solver','ipopt');
optimize(Constraints,Objective,ops);
Solution_7 = value([x y z])   