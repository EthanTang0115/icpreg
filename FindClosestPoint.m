% This function is used to find closest points on the mesh corrresponding
% to d_k
function [b_i,mini_diff] = FindClosestPoint(s_i,M1)
m1=size(s_i,1);
n=size(M1,1);
b_i=zeros(m1,3);
mini_diff=zeros(m1,1);
for i=1:m1
    c_i=zeros(n,3);
    d_i=zeros(n,1);
    for j=1:n
        p=M1(j,1:3);
        q=M1(j,4:6);
        r=M1(j,7:9);
        a=q-p;
        b=r-p;
        c=s_i(i)-p;
        d=[a(1) b(1);a(2) b(2);a(3) b(3)]\(c.');
        lambda=d(1);
        mu=d(2);
        if (lambda >= 0) && (mu >= 0) && (lambda+mu <= 1)
            c_i(j,:)=p+lambda*a+mu*b;
            d_i(j)=norm(s_i(i)-c_i(j,:));
        elseif (lambda+mu) > 1
                c_1=p+lambda*a+mu*b;
                c_i(j,:)=Proj_Segment_3(c_1,q,r);
                d_i(j)=norm(s_i(i)-c_i(j,:));
        elseif lambda < 0
                c_1=p+lambda*a+mu*b;
                c_i(j,:)=Proj_Segment_1(c_1,r,p);
                d_i(j)=norm(s_i(i)-c_i(j,:));
        else
                c_1=p+lambda*a+mu*b;
                c_i(j,:)=Proj_Segment_2(c_1,p,q);
                d_i(j)=norm(s_i(i)-c_i(j,:));
        end
    end
    mini_diff(i,:)=min(d_i);
    [M,I]=min(d_i);
    b_i(i,:)=(c_i(I(1),:));
end
end

