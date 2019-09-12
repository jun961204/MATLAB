function [ x, ex ] = newton3(x0, nmax )
% input
% x0 = initial n max = max
%iteration
   x = x0;
   tol = eps;
    f = @(x) x*sin(x)-1; %function
    df = @(x) sin(x)+x*cos(x);  %differentiate function
    x(1) = x0 - (f(x0)/df(x0));
    ex(1) = abs(x(1)-x0);
    k = 2;
    while (ex(k-1) >= tol) && (k <= nmax)
        x(k) = x(k-1) - (f(x(k-1))/df(x(k-1)));
        ex(k) = abs(x(k)-x(k-1));
        k = k+1;
    end
end