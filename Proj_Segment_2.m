%This function is applied when mu is smaller than zero. 
function [c_edge_projected] = Proj_Segment_2(c,p,q)
lambda_prime=dot((c-p),(q-p))/dot((q-p),(q-p));
a=[lambda_prime,1];
b=[0,min(a)];
lambda_star=max(b);
c_edge_projected=p+lambda_star*(q-p);
end

