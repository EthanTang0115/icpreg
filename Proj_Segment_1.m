%This projection function is applied when lambda is samller than zero. 
function [c_edge_projected] = Proj_Segment_1(c,r,p)
lambda_prime=dot((c-r),(p-r))/dot((p-r),(p-r));
a=[lambda_prime,1];
b=[0,min(a)];
lambda_star=max(b);
c_edge_projected=r+lambda_star*(p-r);
end

