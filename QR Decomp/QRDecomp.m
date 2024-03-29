function [Q,R] = QRDecomp(A)
[m,n]=size(A);
R=A; 
%Start with R=A
%check if A is at full rank
if rank(sym(A)) ~= size(A,2)
    error('A is not full rank')
end
Q=eye(m); %Set Q as the identity matrix

for k=1:n
x=zeros(m,1);
x(k:m,1)=R(k:m,k);
g=norm(x);
v=x; v(k)=x(k)+g;

s=norm(v);
if s~=0
    w=v/s;
    u=2*R'*w;
    R=R-w*u'; %Product HR
    Q=(Q-2*Q*w*w'); %Product QR
end
end

end
