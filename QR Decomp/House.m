function [H] = House(x,y)
%output Qu which is corresponding orthogonal matrix
%error meesage if zero or different length
[m,n]=size(x);
I = eye(m)
if (norm(x,1)==0 || norm(y,1)==0) || (norm(x)~=norm(y))
    error('Error. zero vector or different length of x and y')
end
if norm(x-y)==0
    H = I;
else
u = ((x-y)/norm(x-y))
H = I - 2*u*u.';
end
end


