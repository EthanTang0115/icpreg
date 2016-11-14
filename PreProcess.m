A = importdata(sprintf('/PA3-A-Debug-SampleReadingsTest.txt'));
Data1 = A.('data');
NA = 6;
NB = 6;
ND = 4;
NS = NA+NB+ND;
Nsamps = 15;
Markers_A_Tracker=zeros(NA*Nsamps,3);
for i=1:Nsamps
    Markers_A_Tracker((i-1)*NA+1:i*NA,:)=Data1((i-1)*NS+1:(i-1)*NS+NA,:);
end
Markers_B_Tracker = zeros(NB*Nsamps,3);
for i=1:Nsamps
    Markers_B_Tracker((i-1)*NB+1:i*NB,:)=Data1((i-1)*NS+NA+1:(i-1)*NS+NA+NB,:);
end

B = importdata(sprintf('/Problem3-BodyA.txt'));
Data2 = B.('data');
Markers_A_Body = Data2(1:NA,:);
A_tip=Data2(NA+1,:);

C = importdata(sprintf('/Problem3-BodyB.txt'));
Data3 = C.('data');
Markers_B_Body = Data3(1:NA,:);

R_A = cell(Nsamps,1);
p_A = cell(Nsamps,1);
A_i=Markers_A_Body;
for i = 1:Nsamps
    a_i=Markers_A_Tracker((i-1)*NA+1:i*NA,:);
    [R_A{i},p_A{i}] = RegPointCloud(a_i,A_i,NA);
end

R_B = cell(Nsamps,1);
p_B = cell(Nsamps,1);
B_i=Markers_B_Body;

for i = 1:Nsamps
    b_i=Markers_B_Tracker((i-1)*NB+1:i*NB,:);
    [R_B{i},p_B{i}] = RegPointCloud(b_i,B_i,NB);
end
 
d_k=zeros(Nsamps,3)
for k=1:Nsamps
    d_k(k,:)=R_B{k}.'*(R_A{k}*A_tip.'+p_A{k})-R_B{k}.'*p_B{k};
end