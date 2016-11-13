function [R_reg,p_reg] =ICP_Reg(M,a_i)
m=size(a_i,1);
%n=size(M,1);
%Step1. Apply initial guess of rigid transformation
R_reg_initial=[1 0 0;0 1 0;0 0 1];%For PA 3
p_reg_initial=[0 0 0].';%For PA 3
s_i=zeros(m,3);
for i=1:m
s_i(i,:)=(R_reg_initial*a_i(i,:).'+p_reg_initial).';
end
%Step2. Find closest point
b_i=FindClosestPoint(s_i,M);
%Step3. Find rigid transformation
[R_delta_F_reg,p_delta_F_reg]=RegPointCloud(b_i,s_i,m);
%Step4. update the transformation
%p_delta_F_reg is 3*1
R_reg=R_delta_F_reg*R_reg_initial;
p_reg=(R_delta_F_reg*p_reg_initial+p_delta_F_reg);
end

