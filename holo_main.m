% read the image
triangle = imread("picture1.bmp");

% Display the image with gray colorbar using imagesec which add to the image the pixel axis
figure(1)

triangle = im2double(triangle);
imagesc(triangle);
%%chech imge size
[N ,M] = size(triangle);

%%config important parameters
delta_pix_cam = 2.45*10^(-6); %pixel size
theta =0.015 ;
lamda = 633*(10^(-9)); %%wave lengh
d = 1; %%distace between camera to object

%%create the district numbers for the twidels

dx=lamda*d/(delta_pix_cam*M);
dy=lamda*d/(delta_pix_cam*N);

%%create indexes matrices to create the twidels 
[m,n] = meshgrid(-M/2:M/2-1,-N/2:N/2-1);

%%create reference wave acording to the mission page as image 
reference_amplitude = 100;
reference_wave = (reference_amplitude)*exp((2*1i*pi*(1*theta*m.*delta_pix_cam +1*theta*n.*delta_pix_cam + d))/(lamda));

%%create twidels
twidle_delta_pix_cam = exp((1i*pi/(lamda*d))*((m.*delta_pix_cam).^2+(n.*delta_pix_cam).^2));
twidle_dx_dy = exp((1i*pi/(lamda*d))*((n.*dy).^2+(m.*dx).^2));

%%restore the image acording to mission page
triangle = triangle.*conj(reference_wave);

H_restore =fftshift(fft2(fftshift(triangle.*twidle_delta_pix_cam)));
H_restore = twidle_dx_dy.*H_restore;

%figure the hologram restoration angle:
figure(2);                                
imagesc(angle(H_restore));
title('Hologram angle');

%figure the hologram restoration:
figure(3);                                  
imagesc((abs(H_restore)));
title('Hologram amplitude');

