function [C,A]=CA_poligon(T)
%computes the area A and curve length C of a polygon T
%(with vertices listed in columns of T)
%also plots the poligonn
n=size(T,2);%number of columns (=number of vertices of the poligon)
T=[T T(:,1)];%expand the matrix
A=0;%initial values for the area and circumference
C=0;
plot(T(1,:),T(2,:));%plot the poligon
for i=1:n
    C=C+norm(T(:,i)-T(:,i+1));%add the length of the next edge
    A=A+det(T(:,[i i+1]));%add the unsigned area
end
A=abs(A)/2;%the area


