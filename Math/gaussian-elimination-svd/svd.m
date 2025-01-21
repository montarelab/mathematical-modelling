# Task #2. SVD DECOMPOSITION. find an approximation of an image

% 1. Load image
A=load('lena512.mat');

A=A.lena512; % We get numbers. Because in ML load() returns a struct

% Now A is a matrix containing numbers from 0 to 255
% to get greyscale image we can use
% colormap command, which takes as its argument
% A matrix that determines RGB components for indexed colors

#A=A/256;
#size(A)
#imshow(A)

% image() and imshow()
% image - visualizes a matrix as matrix of numbers. The colors are meaningless
% imshow - trars a matrix as an image. It assumes that elements are pixels

% 1.1 Do scale and colormap, show original image
scale=linspace(0,1,255);
colormap([scale;scale;scale]');
figure(1);
image(A);%produce the image


% 2. Do SVD
[U,S,V]=svd(A);%the svd decompostion
%the matrix S contains the singular values on the diagonal in descending order
# s=diag(S);%extracting the diagonal into a column vector

% 3. Play with n values
for n=[10 20 50 100]%for selected values of n
    figure(n);
    An=U(:,1:n)*S(1:n,1:n)*V(:,1:n)';%we form an approximation
    %of A using only the n largest singular values
    image(round(An)); % round rounds entries of the matrix
endfor

