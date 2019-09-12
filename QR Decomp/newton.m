function [ x, ex ] = newton(x0, nmax )
% input
%x0 = initial n max = max
%iteration
   x = x0;
   tol = eps;
    f = @(x) x^3-2*x-5; %function
    df = @(x) 3*x^2-2;  %differentiate function
    x(1) = x0 - (f(x0)/df(x0));
    ex(1) = abs(x(1)-x0);
    k = 2;
    while (ex(k-1) >= tol) && (k <= nmax)
        x(k) = x(k-1) - (f(x(k-1))/df(x(k-1)));
        ex(k) = abs(x(k)-x(k-1));
        k = k+1;
    end
end