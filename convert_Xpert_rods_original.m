[fname fpath]=uigetfile('*.csv');
gg=importdata([fpath,'/' fname]);

step=1;
c=input('Enter the substrate lattice constant (A) : '); ;   % change this value to  your substrate c lattice constant
theta=gg(:,1);
I1=gg(:,2);
I=I1;
l_value=2


[val, idx] = max(I1);%find 00L peak
ref=l_value*asind(1.54/c);
dif = theta(idx) - ref;
theta = theta - dif;%remove offset

LP=1;

q=(2*sind(0.5*theta)*c/1.54);
step=1;

subplot(2,1,1);hold on
semilogy(q(1:step:end),I(1:step:end),'-o');

subplot(2,1,2);hold on
semilogy(theta,I(1:step:end),'-o');

I=I.*LP;
out=[q(1:2:end)*0 q(1:2:end)*0 q(1:2:end) (I(1:2:end)) I(1:2:end)];
out=out(out(:,4)>0,:);
out_ang=[theta I sqrt(I)];



grid
save Correctect_data2.dat out -ascii

out_ang=out_ang(out_ang(:,2)>0,:);
save Corrected_Data_ang.dat out_ang -ascii
out_ang=out_ang(out_ang(:,1)>0.2,:);
save Corrected_Data_ang.dat out_ang -ascii
out_ang=out_ang(out_ang(:,1)<7,:);
save Corrected_Data_ang2.dat out_ang -ascii