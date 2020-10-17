load /home/nirav/elec301/lena256.mat;
imagesc(lena256); colormap(gray(256));
[qmf, dqmf] = MakeBSFilter('Deslauriers', 3);
% The MakeBSFilter function creates biorthonormal filter pairs. The filter
% pairs that we're making is an Interpolating (Deslauriers-Dubuc) filter
% of polynomial degree 3
wc = FWT2_PB(lena256, 1, qmf, dqmf);
% wc correspond to the wavelet coefficients of the sample image
% FWT2_PB is a function that takes a 2 dimensional wavelet transform
% We specify the image matrix, the level of coarseness (1), the quadrature
% mirror filter (qmf), and the dual quadrature mirror filter (dqmf)
% we take a tolerance which is some fraction
% of the norm of the sample image
nl = norm(lena256) / (4 * norm(size(lena256)));
% if the value of the wavelet coefficient matrix at a particular
% row and column is less than the tolerance, we 'throw' it out
% and increment the zero count.
zerocount = 0;
for i = 1:256
for j = 1:256
if ( abs(wc(i,j)) < nl)
wc(i,j) = 0;
zerocount = zerocount +
1; end
end
end
x = IWT2_PB(wc, 1, qmf, dqmf);
imagesc(x);
% here is some sample code to view how these deslauriers wavelets look
[qmf, dqmf] = MakeBSFilter('Deslauriers',
3); for i = 1:256
for j = 1:256
wc(i,j) = 0;
end
end
% this is the Deslauriers(4,2) matrix
wc(4, 2) = 1000;
x = IWT2_PB(wc, 1, qmf, dqmf);
imagesc(x);