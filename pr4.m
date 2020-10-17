% smoothing in eight bit color and monochrome
% parameter definition
% get image from MATLAB
library load('clown');
% construct convolution functions
[m,n] = size(X);
gs = [0.5 0.5]; ge = [];
hs = [0.5 0.5]; he = [];
g = [gs,zeros(1,m-length(gs)-length(ge)),ge];
h = [hs,zeros(1,n-length(hs)-length(he)),he];
% construct convolution matrices and blur sparse
matrices Y = spcnvmat(g);
Z = spcnvmat(h);
W = Y*X*Z';
% show original and blurred images
figure(1);
imshow(X,[]);
figure(2);
imshow(W,[]);
figure(3);
imshow(X,[]);
colormap(map)
figure(4);
imshow(W,[]);
colormap(map)