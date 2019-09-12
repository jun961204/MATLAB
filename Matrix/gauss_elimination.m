
function x = gauss_elimination(A,b)
% check if A is square
[m,n]= size(A); 
if m ~= n
  disp('Not a square');
else
%check if A is singluar
if det(A)==0
    disp('A is singular')
else
%proceed if A is not square and non singular
%create row to record
for d=1:n
   arr(d)=d;
end
%create augmented matrix
A = [A,b];  

for i = 1:n-1
    pivot = i;
    %select pivot
    for j = i+1:n
        if  abs(A(arr(i),i)) < abs(A(arr(i),i))
            t = arr(i);
            arr(i) = arr(j);
            arr(j) = t;
        end
    end
    while (pivot <= n && A(pivot,i)== 0)
        pivot = pivot+1;
    end
    if pivot > n
        disp('No unique solution');
        break
    else
        if pivot > i
            tem = arr(i);
            arr(i) = pivot;
            pivot= tem;
        end
    end

    for j = i+1:n
        m = -A(arr(j),i)/A(arr(i),i);
        for k = i+1:n+1 
            A(arr(j),k) = A(arr(j),k) + m*A(arr(i),k);
        end
    end
end

%backward substitution
x(n) = A(arr(n),n+1)/A(arr(n),n);
for i = n - 1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(arr(i),j)*x(j);
    end
    x(i) = (A(arr(i),n+1) - sum)/A(arr(i),i);
end
x=x'; %transpose x
end
end
end