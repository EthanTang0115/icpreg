%Design a mesh
%define 8 vertex points
vertex_1=[0 0 0];
vertex_2=[5 0 0];
vertex_3=[5 5 0];
vertex_4=[0 5 0];
vertex_5=[0 0 5];
vertex_6=[5 0 5];
vertex_7=[5 5 5];
vertex_8=[0 5 5];
%define 12 triangles
triangles=zeros(12,9);
triangles(1,:)=[vertex_1,vertex_2,vertex_4];
triangles(2,:)=[vertex_2,vertex_3,vertex_4];
triangles(3,:)=[vertex_1,vertex_4,vertex_5];
triangles(4,:)=[vertex_4,vertex_5,vertex_8];
triangles(5,:)=[vertex_5,vertex_6,vertex_8];
triangles(6,:)=[vertex_6,vertex_7,vertex_8];
triangles(7,:)=[vertex_3,vertex_6,vertex_7];
triangles(8,:)=[vertex_2,vertex_3,vertex_6];
triangles(9,:)=[vertex_2,vertex_5,vertex_6];
triangles(10,:)=[vertex_1,vertex_2,vertex_5];
triangles(11,:)=[vertex_3,vertex_7,vertex_8];
triangles(12,:)=[vertex_3,vertex_4,vertex_8];
%deine 20 3D points
%6 3D points whose closest points should be on the edge of triangle
p=zeros(20,3);
p(1,:)=[2.5 2.5 6.5];%Ans:[2.5 2.5 5]
p(2,:)=[2.5 2.5 -3.5];%Ans:[2.5 2.5 0]
p(3,:)=[8.5 2.5 2.5];%Ans:[5 2.5 2.5]
p(4,:)=[-1.5 2.5 2.5];%Ans:[0 2.5 2.5]
p(5,:)=[2.5 -3 2.5];%Ans:[2.5 0 2.5]
p(6,:)=[2.5 8 2.5];%Ans:[2.5 5 2.5]
% 8 3D points whose closest points shloud be vertex points
p(7,:)=[-1.5 0 0];%Ans:[0 0 0]
p(8,:)=[5 -0.5 0];%Ans:[5 0 0]
p(9,:)=[7 5 0];%Ans:[5 5 0]
p(10,:)=[0 8 0];%Ans:[0 5 0]
p(11,:)=[-3 0 5];%Ans:[0 0 5]
p(12,:)=[5 -2 5];%Ans:[5 0 5]
p(13,:)=[5 7 5];%Ans:[5 5 5]
p(14,:)=[-2.7 5 5];%Ans:[0 5 5]
% 6 3D points whose closest point are in triangles
p(15,:)=[2.5 2.1 6.5];%Ans:[2.5 2.1 5]
p(16,:)=[2.2 2.5 -3.5];%Ans:[2.2 2.5 0]
p(17,:)=[8.5 2.3 2.5];%Ans:[5 2.3 2.5]
p(18,:)=[-1.5 2.5 2.4];%Ans:[0 2.5 2.4]
p(19,:)=[2.6 -3 2.5];%Ans:[2.6 0 2.5]
p(20,:)=[2.5 8 2.7];%Ans:[2.5 5 2.7]
%Apply 'FindClosestPoint'
[b_i,mini_diff] = FindClosestPoint(p,triangles);
disp(b_i);
%Finally compare b_1 with expected answers, which are:
%[2.5 2.5 5]
%[2.5 2.5 0]
%[5 2.5 2.5]
%[0 2.5 2.5]
%[2.5 0 2.5]
%[2.5 5 2.5]
%[0 0 0]
%[5 0 0]
%[5 5 0]
%[0 5 0]
%[0 0 5]
%[5 0 5]
%[5 5 5]
%[0 5 5]
%[2.5 2.1 5]
%[2.2 2.5 0]
%[5 2.3 2.5]
%[0 2.5 2.4]
%[2.6 0 2.5]
%[2.5 5 2.7]

