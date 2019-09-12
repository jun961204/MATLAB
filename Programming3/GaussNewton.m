 function [unknowns,S] = GaussNewton(xvalue, yvalue, cvalue)
%GaussNewton- uses the Gauss-Newton method
% input x-value = data generated 
% y-value = data generated with noise
% c-value = initial guess of c
format long
tol = 1e-20;
a = cvalue; %initial approximations for unknowns
maxstep = 300; %set maximum number of steps to run
q = yvalue; %y value of generated data
p = xvalue;%x values of data generated
m=length(p); %determine number of functions
n=length(a); %determine number of unkowns
aold = a; %set aold equal to initial guess
for k=1:maxstep %iterate through process
 S = 0;
 for i=1:m
 for j=1:n
 J(i,j) = df(p(i),a(1,1),a(2,1),a(3,1),a(4,1),j); %calculate Jacobian
 JT(j,i) = J(i,j); %and its trnaspose
 end
 end
 Jz = -JT*J; %multiply Jacobian and
 %negative transpose
 for i=1:m
% r(i,1) = q(i) - (1*exp(-0.5*p(i))*sin(2*p(i)+0)); %calculate r

 r(i,1) = q(i) - (a(1,1)*exp(a(2,1)*p(i))*sin(a(3,1)*p(i)+a(4,1))); %calculate r
 S = S + r(i,1)^2; %calculate sum of squares of residuals
 end
 g = Jz\JT; %mulitply Jz inverse by J transpose
 a = aold-g*r; %calculate new approximation of a
 unknowns = a;
 err(k) = a(1,1)-aold(1,1); %calculate error
 if (abs(err(k)) <= tol) %if less than tolerance break
 break
 end
 aold = a; %set aold to a
end

end
function value = df(p,a1,a2,a3,a4,index) %calculate partials derivatives
switch index
 case 1
 value = exp(a2*p)*sin(a3*p+a4);
 case 2
 value = a1*p*exp(a2*p)*sin(a3*p+a4);
 case 3
 value = a1*p*exp(a2*p)*cos(a3*p+a4);
 case 4
 value = a1*exp(a2*p)*cos(a3*p+a4);
end
end
