function [ x, ex ] = bi2(min, max, nmax )
% input
%x0 = initial n max = max
%iteration
    ave = (min+max)/2;
    ex(1) = abs(max-min);
    ave(1) = ave;
    tol = eps*10;
 f = @(x) exp(-x)-x; %function    

    k = 2;
     while (ex(k-1)>= eps) && (k <= nmax) && sign(f(min(end))~=(sign(f(max(end)))))
        ave(k) = (min(end) + max(end))/2;
        if sign(f(ave(k)))==sign(f(min(end)))
            min = [min, ave(end)];
        else
            max = [max, ave(end)];
        
        x = ave;
        ex(k) = 0.5*(ex(k-1));
                k = k+1;

        end
    end
end