
%First load and display the original image.
I = imread('sinePulses.tif');
imagesc(I)
title('Original')
imagesc(I)
[a,h,v,d] = swt2(I,1,'sym4');
size(I)

%View the approximation coefficients. 
%To prevent an error when using imagesc, first squeeze the approximation coefficients array to remove the singleton dimension.
asqueeze = squeeze(a);
size(asqueeze)
figure
imagesc(uint8(asqueeze))
title('Approximation Coefficients')

%Reconstruct the image by performing the inverse transform.
%Compute the difference between the original image and reconstruction.
rec = iswt2(a,h,v,d,'sym4');
figure 
imagesc(rec)
maxdiff = max(abs(uint8(rec(:))-I(:)));
disp(['maximum difference = ' num2str(maxdiff)])