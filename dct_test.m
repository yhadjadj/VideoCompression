close all
clc

% read image
I = imread('image.jpg');
I = im2double(I);

% get image Y
R=I(:,:,1);
V=I(:,:,2);
B=I(:,:,3);

Y = 0.299*R+0.587*V+0.114*B;

ti=size(I);
zer=zeros(ti,'uint8');
img_Y=zer;
img_Y(:,:,1)=Y;
img_Y(:,:,2)=Y;
img_Y(:,:,3)=Y;

figure(1)
imshow(Y);
title('Y image');

I = Y;

% Compute the two-dimensional DCT of 8-by-8 blocks in the image. 
% The function dctmtx returns the N-by-N DCT transform matrix. 
T = dctmtx(8);
B_DCT = dct(I,T);



% Simple quantification matrix
N = 8;
mask = zeros(8);
filtre = ones(N);
mask(1:N,1:N) = filtre;

% Compute the inverse DCT
B_IDCT = idct(B_DCT,T, mask);
figure(3)
imshow(B_IDCT)
title('IDCT');