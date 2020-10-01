close all;
clear all;
x=imread('Test.jpg');
subplot(2,2,1);
imshow(x);title('Original Image');
% Low pass Filter
dimension=size(x);
D0=15;
x=double(x);
M=dimension(1);
N=dimension(2);
filt=zeros(M,N); % filter
for i=1:M
for j=1:N
filt(i,j)=exp(-((i-M/2).^2+(j-N/2).^2)/(2*(D0^2)));
end
end
freq_im=fft2(x);
freq_im=fftshift(freq_im);
y=(1/(M*N))*freq_im; % 1/MN should be added by the user
filt_im=y.*filt(1,1);
new_freq=ifftshift(filt_im);
new_im=ifft2(new_freq,M,N);
subplot(2,2,2);
imshow(new_im);title('Low Pass Image');
%High pass Filter
dimension=size(x);
D0=100;
x=double(x);
M=dimension(1);
N=dimension(2);
filt=zeros(M,N); % filter
for i=1:M
for j=1:N
filt(i,j)=exp(-((i-M/2).^2+(j-N/2).^2)/(2*(D0^2)));
end
end
freq_im=fft2(x);
freq_im=fftshift(freq_im);
y=(1/(M*N))*freq_im; % 1/MN should be added by the user
filt_im=y.*(1-filt);
new_freq=ifftshift(filt_im);
new_im=real(ifft2(new_freq,M,N));
subplot(2,2,3);
imshow(new_im);title('High Pass Image')