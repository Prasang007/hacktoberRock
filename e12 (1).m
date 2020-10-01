I = imread('Test.jpeg');
subplot(3,3,1);imshow(I);title('Original Image');
H = fspecial('average',3);
MotionBlur = imfilter(I,H,'replicate');
subplot(3,3,2)
imshow(MotionBlur);
title('Average 3X3');
H = fspecial('average',5);
MotionBlur = imfilter(I,H,'replicate');
subplot(3,3,3)
imshow(MotionBlur);
title('Average 5X5');
H = fspecial('average',9);
MotionBlur = imfilter(I,H,'replicate');
subplot(3,3,4)
imshow(MotionBlur);
title('Average 9X9');
H = fspecial('average',15);
MotionBlur = imfilter(I,H,'replicate');
subplot(3,3,5)
imshow(MotionBlur);
title('Average 15X15');