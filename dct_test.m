
clear variables
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
title('DCT');

I = Y;
% Compute the two-dimensional DCT of 8-by-8 blocks in the image. 
% The function dctmtx returns the N-by-N DCT transform matrix. 
T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(I,[8 8],dct);

% Discard all but 10 of the 64 DCT coefficients in each block.
mask = zeros(8);
N = 1;
mask_to_one = ones(N);
mask(1:N,1:N) = 1;


%mask = [1   1   0   0   0   0   0   0
%        1   1   0   0   0   0   0   0
%        0   0   0   0   0   0   0   0
%        0   0   0   0   0   0   0   0
%        0   0   0   0   0   0   0   0
%        0   0   0   0   0   0   0   0
%        0   0   0   0   0   0   0   0
%        0   0   0   0   0   0   0   0];
    

B2 = blockproc(B,[8 8],@(block_struct) mask .* block_struct.data);

% Reconstruct the image using the two-dimensional inverse DCT of each block.
invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(B2,[8 8],invdct);

% Display the original image and the reconstructed image, 
% side-by-side. Although there is some loss of quality in the reconstructed image, it is clearly recognizable, even though almost 85% of the DCT coefficients were discarded.
figure(2)
imshow(I2)
title('Inverse DCT');

I3 = blockproc(B2,[8 8],dct);
figure(3)
imshow(I3)
title('I3');
