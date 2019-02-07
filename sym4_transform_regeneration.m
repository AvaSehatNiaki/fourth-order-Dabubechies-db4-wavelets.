%First load and display the original image.
I = imread('sinePulses.tif');
imagesc(I)
title('Original')

%perform the stationary wavelet decomposition of the image at level 2 using

[ca,chd,cvd,cdd] = swt2(I,2,'sym4');

%zeroing out Hz, Vr, Di matrixes 
ca(:,:,1) =0
%chd(:,:,1) =0
cvd(:,:,1) =0
cdd(:,:,1) =0

ca(:,:,2) =0
%chd(:,:,2) =0
cvd(:,:,2) =0
cdd(:,:,2) =0

%reconstructing image
disp(chd)
Xsyn = iswt2(ca,chd,cvd,cdd,'sym4');
figure
imagesc(Xsyn)

