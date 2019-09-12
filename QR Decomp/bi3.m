function [ x, ex ] = bi3(min, max, nmax )
% input
%x0 = initial n max = max
%iteration
    ave = (min+max)/2;
    ex(1) = abs(max-min);
    ave(1) = ave;
    tol = eps*10;
    f = @(x) x*sin(x)-1; 
    

    k = 2;
    while (ex(end)>= eps) && (k <= nmax) &&(sign(f(min(end))))~=sign(f(max(end)))
        ave(k) = (min(end) + max(end))/2;
        if sign(f(ave(k)))==sign(f(min(end)))
            min = [min, ave(end)];
        else
            max = [max, ave(end)];
        
        x = ave;
        ex = [ex, 2^(1-k)];
              

        end
          k = k+1;
    end
end