%First load and display the original image.
I = imread('vase.tif');
imagesc(I)
title('Original')

%perform the stationary wavelet decomposition of the image at level 2 using
%db4
[ca,chd,cvd,cdd] = swt2(I,2,'db4');

%Extract the Level 1 approximation and detail coefficients from the decomposition.
A1 = wcodemat(ca(:,:,1),255);
H1 = wcodemat(chd(:,:,1),255);
V1 = wcodemat(cvd(:,:,1),255);
D1 = wcodemat(cdd(:,:,1),255);

%Extract the Level 2 approximation and detail coefficients from the decomposition.
A2 = wcodemat(ca(:,:,2),255);
H2 = wcodemat(chd(:,:,2),255);
V2 = wcodemat(cvd(:,:,2),255);
D2 = wcodemat(cdd(:,:,2),255);

%Display the approximation and detail coefficients from the two levels.
subplot(2,2,1)
imagesc(A1)
title('Approximation Coef. of Level 1')

subplot(2,2,2)
imagesc(H1)
title('Horizontal Detail Coef. of Level 1')

subplot(2,2,3)
imagesc(V1)
title('Vertical Detail Coef. of Level 1')

subplot(2,2,4)
imagesc(D1)
title('Diagonal Detail Coef. of Level 1')

%Extract the Level 1 and Level 2 approximation and detail coefficients from the decomposition.
figure
subplot(2,2,1)
imagesc(A2)
title('Approximation Coef. of Level 2')

subplot(2,2,2)
imagesc(H2)
title('Horizontal Detail Coef. of Level 2')

subplot(2,2,3)
imagesc(V2)
title('Vertical Detail Coef. of Level 2')

subplot(2,2,4)
imagesc(D2)
title('Diagonal Detail Coef. of Level 2')

%zeroing out Hz, Vr, Di matrixes 
%chd(:,:,1) =0
%cvd(:,:,1) =0
%cdd(:,:,1) =0

%chd(:,:,2) =0
%cvd(:,:,2) =0
cdd(:,:,2) =0

%reconstructing image
disp(chd)
Xsyn = iswt2(ca,chd,cvd,cdd,'db4');
figure
imagesc(Xsyn)

