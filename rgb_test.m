clear variables
close all
clc

% Fichier image ? traiter

fic='image.jpg';

% Lecture et Affichage de l'image
img=imread(fic);
ti=size(img);

figure(1)
imshow(img);
title(['Image originale : ',fic])
xlabel(['R?solution de l''image : ',num2str(ti(2)),'x',num2str(ti(1))])

R=img(:,:,1);
V=img(:,:,2);
B=img(:,:,3);

zer=zeros(ti,'uint8');

% Calcul

img_R=zer;
img_V=zer;
img_B=zer;

img_Y=zer;
img_Cb=zer;
img_Cr=zer;

% S?paration et affichage des canaux

img_R(:,:,1)=R;
img_V(:,:,2)=V;
img_B(:,:,3)=B;

% Calcul des Composantes
% Y (luminance - Image en niveaux de gris)
% Cb (chrominance bleue)
% Cr (chrominance rouge)

Y = 0.299*R+0.587*V+0.114*B;
Cb= -0.1687*R-0.3313*V+0.5*B+128;
Cr = 0.5*R-0.4187*V-0.0813*B+128;

figure(2)
subplot(131)
imshow(img_R)
title('Composante R')
subplot(132)
imshow(img_V)
title('Composante V')
subplot(133)
imshow(img_B)
title('Composante B')

img_Y(:,:,1)=Y;
img_Y(:,:,2)=Y;
img_Y(:,:,3)=Y;

figure(3)
imshow(img_Y);
title('Image en niveaux de gris (Luminance Y)')

img_Cb(:,:,1)=Y;
img_Cb(:,:,2)=Y;
img_Cb(:,:,3)=Y;

% Y, Cr NULL
img_Cb(:,:,1)=1.402*(-128);                         %R
img_Cb(:,:,2)=-0.34414*(Cb-128)-0.71414*(-128);     %V
img_Cb(:,:,3)=1.772*(Cb-128);                       %B

figure(4)
imshow(img_Cb);
title('Chrominance bleue (Cb)')

% Y, Cb NULL
img_Cr(:,:,1)=1.402*(Cr-128);                        %R
img_Cr(:,:,2)=-0.34414*(-128)-0.71414*(Cr-128);      %V
img_Cr(:,:,3)=1.772*(-128);                          %B

figure(5)
imshow(img_Cr);
title('Chrominance rouge (Cr)')
