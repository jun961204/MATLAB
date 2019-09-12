function [bool] = steepestdescent(a,b)
%steppestdescent method
%b = r = 1/2 
%find alpha until a = ba
f=@(x)(-cos(x(1))*cos((x(2))/5)); %f(x1, x2)

x=[a b]';
gf=@(x)([(sin(x(1))*cos((x(2))/5)) ; ((1/5)*cos(x(1))*sin((x(2))/5))]); %gradient
h1 = @(x)(cos(x(1))*cos(x(2)/5)); %hessian11
h2 = @(x)((cos(x(1)).^2)*(cos(x(2)/5).^2)-(sin(x(1)).^2)*(sin(x(2)/5).^2))>0; %determinant of hessian
alpha=1;
while((f(x-alpha*gf(x)))>(f(x)-(1/2)*alpha*norm(gf(x)))) %obtain step size alpha   
   alpha = alpha/2;  %alpha = b * alpha
end
                                                                                                                                                                                                                   alpha = 0.001;
%problem is alpha gets too small that x equals x-alpha*gf(x) so alpha set
%0.001

i = 0;
while(f(x)>(f(x+alpha*-gf(x)))&&i<1000)
    x=x-alpha*gf(x);
    i = i+1;
end
bool = (h1(x) > 0) && (h2(x) > 0); %output will be boolean value of Hessian(1,1) and hessian determinant to be positive
end

