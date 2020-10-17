% demonstrate edge detection
% numbers of
colors sncols=128;
ncols=32;
% get image from MATLAB
image load('trees');
% show original image
figure(1);
showgimg(real(X),sncols);
drawnow;
% construct convolution
functions [m,n] = size(X);
gs = [1 -1]; ge = [];
hs = [1 -1]; he = [];
g = [gs,zeros(1,m-length(gs)-length(ge)),ge];
h = [hs,zeros(1,n-length(hs)-length(he)),he];
% construct convolution matrices as sparse
matrices Y = spcnvmat(g);
Z = spcnvmat(h);
Wg = Y*X;
Wh = X*Z';
% show transformed images
figure(2);
showgimg(Wg,ncols);
drawnow;
figure(3)
showgimg(Wh,ncols);
drawnow;
figure(4)
showgimg(abs(Wg)+abs(Wh),ncols);
drawnow;