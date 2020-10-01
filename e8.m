close all;
clear all;
I = imread('Test.jpeg');
subplot(2,3,1);
imshow(I); title('Original Image');
% Image Averaging
H = fspecial('motion',20,45);
MotionBlur = imfilter(I, H, 'replicate');
subplot(2,3,2);
imshow(MotionBlur);title('Motion Blurred Image');
H = fspecial('disk',10);
blurred = imfilter(I, H, 'replicate');
subplot(2,3,3);
imshow(blurred); title('Blurred Image');
H = fspecial('unsharp');
sharpened = imfilter(I, H, 'replicate');
subplot(2,3,4);
imshow(sharpened); title('Sharpened Image');
% Image Subtraction.
background = imopen(I, strel('disk',15));
subplot(2,3,5);
imshow(background); title('Background Image');
subplot(2,3,6);
I2 = imsubtract(I, background);
imshow(I2); title(' Subtracted Image');