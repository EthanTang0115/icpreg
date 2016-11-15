% This function is used to find closest points on the mesh corresponding
% to d_k
function [closest_points_on_meshes,mini_distance] = FindClosestPoint_BoundingSphere(source_points,target_triangle_meshes)
% Allocate space for variables
number_of_source_points = size(source_points,1);
number_of_target_triangles = size(target_triangle_meshes,1);
closest_points_on_meshes = zeros(number_of_source_points,3);
mini_distance = zeros(number_of_source_points,1);

% Iteration for each source point to find its corresponding closest point
for i=1:number_of_source_points
    closest_point_on_mesh = zeros(number_of_target_triangles,3);
    distance_to_closest_point = zeros(number_of_target_triangles,1);
    for j=1:number_of_target_triangles
        p=target_triangle_meshes(j,1:3);
        q=target_triangle_meshes(j,4:6);
        r=target_triangle_meshes(j,7:9);
        a=q-p;
        b=r-p;
        c=source_points(i)-p;
        d=[a(1) b(1);a(2) b(2);a(3) b(3)]\(c.');
        lambda=d(1);
        mu=d(2);
        if (lambda >= 0) && (mu >= 0) && (lambda+mu <= 1)
            closest_point_on_mesh(j,:)=p+lambda*a+mu*b;
            distance_to_closest_point(j)=norm(source_points(i)-closest_point_on_mesh(j,:));
        elseif (lambda+mu) > 1
                c_1=p+lambda*a+mu*b;
                closest_point_on_mesh(j,:)=Proj_Segment_3(c_1,q,r);
                distance_to_closest_point(j)=norm(source_points(i)-closest_point_on_mesh(j,:));
        elseif lambda < 0
                c_1=p+lambda*a+mu*b;
                closest_point_on_mesh(j,:)=Proj_Segment_1(c_1,r,p);
                distance_to_closest_point(j)=norm(source_points(i)-closest_point_on_mesh(j,:));
        else
                c_1=p+lambda*a+mu*b;
                closest_point_on_mesh(j,:)=Proj_Segment_2(c_1,p,q);
                distance_to_closest_point(j)=norm(source_points(i)-closest_point_on_mesh(j,:));
        end
    end
    mini_distance(i,:)=min(distance_to_closest_point);
    [M,I]=min(distance_to_closest_point);
    closest_points_on_meshes(i,:)=(closest_point_on_mesh(I(1),:));
end


