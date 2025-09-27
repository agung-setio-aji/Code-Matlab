clc;
clear;
close all;

fprintf('Metode Eleminasi Gauss Jordan \n\n');

A = [2 1 3 0 4;
     1 2 3 3 0;
     1 1 0 3 2;
     1 1 1 1 2;
     1 2 0 1 2];
B=[10; 13; 10; 7; 7];

n=length(B);
X=zeros(n,1);

for k=1 :n-1
    for i=k+1:n
        p=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-p*A(k,j);
        end
        B(i)=B(i)-p*B(k);
    end
end

X(n)=B(n)/A(n,n);
for k=n-1:-1:1
    D=0;
    for j=k+1:n
        D=D+A(k,j)*X(j);
    end
    X(k)=(B(k)-D)/A(k,k);
end
X

