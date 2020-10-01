close all;
clear all;
A= imread('Test.jpeg');
I = rgb2gray(A);
subplot(2,2,1);
imshow(I);
title('Original Image');
w = imnoise(I,'salt & pepper',0.2);
subplot(2,2,2)
imshow(w);
title('Salt and Pepper Noise');
K = medfilt2(w);
subplot(2,2,3)
imshow(K);
title('Filtered Image')
m = medfilt2(K);
subplot(2,2,4)
imshow(m);
title('Filtered Image2')