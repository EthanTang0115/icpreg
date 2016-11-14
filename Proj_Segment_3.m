%This function is applied when the sum of lambda and mu is larger than
%zero.
function [c_edge_projected] = Proj_Segment_3(c,q,r)
lambda_prime=dot((c-q),(r-q))/dot((r-q),(r-q));
a=[lambda_prime,1];
b=[0,min(a)];
lambda_star=max(b);
c_edge_projected=q+lambda_star*(r-q);
end

