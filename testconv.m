
load Y

filter = zeros([3 3],'uint8');
filter(1)=1;
filter(3)=1;
filter(5)=1;
filter(7)=1;
filter(9)=1;

Yconv = myconv(Y,filter);

ti = [size(Yconv) 3];
zer=zeros(ti,'uint8');

img_Yconv=zer;

img_Yconv(:,:,1)=Yconv;
img_Yconv(:,:,2)=Yconv;
img_Yconv(:,:,3)=Yconv;

figure(1)
imshow(img_Yconv);
title('Image conv en niveaux de gris (Luminance Y)')

tiorigin = [size(Y) 3];
zer=zeros(tiorigin,'uint8');

img_Y=zer;

img_Y(:,:,1)=Y;
img_Y(:,:,2)=Y;
img_Y(:,:,3)=Y;

figure(2)
imshow(img_Y);
title('Image en niveaux de gris (Luminance Y)')