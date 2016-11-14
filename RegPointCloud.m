%  This function is used to conduct simple point set to point set registration
%
%  Created for CIS-I Programming Assignment #1
%
%  (c) Yichuan Tang
%  Date: Oct.15 2016
%  Clarification: This MATLAB program is written based on the theoretical
%  formulation provided by Paul J. Besl and Neil D. Mckay in their work "A
%  Method for Registration of 3-D Shapes",IEEE,1992
%
%  -----------------------------------------------------------------------
%   Input variables: NB             - Number of points in a ponit set
%                    Point_set_CT   - Point set in CT coordinates
%                    Point_set_EM   - Point set in EM tracker coordinates
%   Output values:   R              - Rotation part of the rigid transformation
%                    q_T            - Translation part of the rigid transformation 
% -----------------------------------------------------------------------
%
% F = [R,q_T]
% P_CT = F * P_EM
%
function [R,q_T] = RegPointCloud(Point_set_CT, Point_set_EM, NB)
%% a.Create initial variables
N_CT=NB;
N_EM=NB;
sum_CT=zeros(3,1);
sum_EM=zeros(3,1);
sum_Sigma=zeros(3,3);
%% b.Compute the center of mass for each point set
for i = 1:N_CT
sum_CT=sum_CT+Point_set_CT(i,:).';
end
Mu_CT=(1/N_CT)*sum_CT;
for i = 1:N_EM   
sum_EM=sum_EM+Point_set_EM(i,:).';
end
Mu_EM=(1/N_CT)*sum_EM;
%% c.Compute cross-covariance matrix Sigma
for i = 1:N_EM   
sum_Sigma=sum_Sigma+(Point_set_EM(i,:).'-Mu_EM)*(Point_set_CT(i,:).'-Mu_CT).';
end
Sigma=(1/N_EM)*sum_Sigma;
%% d.Construct skew-symmetric matrix A from Sigma
A=Sigma-Sigma.';
%% e.Construct a vector Delta from A
Delta=[A(2,3),A(3,1),A(1,2)].';
%% f.Construct a matrix Q_Sigma from Sigma and Delta
Q_Sigma=zeros(4,4);
Q_Sigma(1,1)=trace(Sigma);
Q_Sigma(1,2:4)=Delta.';
Q_Sigma(2:4,1)=Delta;
Q_Sigma(2:4,2:4)=Sigma+Sigma.'-trace(Sigma)*eye(3);
%% f.Compute the unit eigenvector of Q_Sigma corresponding to the maximum eigenvalue
[eig_vec,eig_val]=eig(Q_Sigma);
eig_val_vec=zeros(4,1);
for i=1:4
eig_val_vec(i)=eig_val(i,i);
end
 [M,I]=max(eig_val_vec.');
q_R=eig_vec(:,I(1));
q_R=q_R/norm(q_R,2);
%% g.The unit eigenvector is chosen as rotation quaternion
R = quat2rotm(q_R.');
%% g.Compute the translation part
q_T=Mu_CT-R*Mu_EM;
end