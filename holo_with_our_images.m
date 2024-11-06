%%our image size
M = 1024;
N = 1024;

%%create the square image
img_square = zeros(M,N);
img_square((M/2-15):(M/2+15),(N/2-15):(N/2+15))=1;
 figure(1)
 imagesc(img_square);
 title('img square')

% Create a matrix of zeros
circleMatrix = zeros(M,N);
center = [M/2,N/2];
r = 30;
for i = 1:M
    for j = 1:N
        if (((i - center(1))^2 + (j - center(2))^2)<=r^2)
            circleMatrix(i,j) = 1;
        end
    end
end
% % figure(1)
% %  imagesc(circleMatrix);
% %  title('circleMatrix')

% Define the size of the image
image_size = M;

% Create a binary mask for the triangle
mask = false(image_size);

% Define the vertices of the triangle
vertex1 = [480, 520];
vertex2 = [520, 520];
vertex3 = [500, 480];

% Create a polygon using the vertices
triangle = poly2mask([vertex1(1), vertex2(1), vertex3(1)],[vertex1(2), vertex2(2), vertex3(2)],image_size, image_size);

% Set the triangle region in the mask to true
mask(triangle) = true;

% Display the triangle
% % figure(1)
% % imagesc(mask);
% % title('Triangle Mask');

%%config important parameters
delta_pix_cam = 10^(-5); %pixel size
theta =0.01;
lamda = 633*(10^(-9)); %%wave lengh
d = 1; %%distace between camera to object

%%create the district numbers for the twidels

dx=lamda*d/(delta_pix_cam*M);
dy=lamda*d/(delta_pix_cam*N);

%%create indexes matrices to create the twidels 
[m,n] = meshgrid(-M/2:M/2-1,-N/2:N/2-1);

% create twidels
twidle_delta_pix_cam = exp((1i*pi/(lamda*d))*((m.*delta_pix_cam).^2+(n.*delta_pix_cam).^2));
twidle_dx_dy = exp((1i*pi/(lamda*d))*((n.*dy).^2+(m.*dx).^2));

%%create reference wave acording to the mission page as image 
reference_amplitude = 100;
reference_wave = (reference_amplitude)*exp((2*1i*pi*(1*theta*m.*delta_pix_cam +1*theta*n.*delta_pix_cam + d))/(lamda));

%create hologram
img =img_square.*twidle_dx_dy;
hologram_no_ref = fftshift(fft2(fftshift(img)));
hologram_no_ref = twidle_delta_pix_cam.*hologram_no_ref;
hologram_ref = (abs(hologram_no_ref + reference_wave)).^2;
figure(2)
imagesc(hologram_ref)
title('hologram')

%%restore the image acording to mission page
d=1.2;
twidle_delta_pix_cam = exp((1i*pi/(lamda*d))*((m.*delta_pix_cam).^2+(n.*delta_pix_cam).^2));
twidle_dx_dy = exp((1i*pi/(lamda*d))*((n.*dy).^2+(m.*dx).^2));



triangle = hologram_ref.*conj(reference_wave);
H_restore =fftshift(fft2(fftshift(triangle.*twidle_delta_pix_cam)));
H_restore =twidle_dx_dy.* H_restore;

%figure the hologram restoration angle:
figure(3);                                
imagesc(angle(H_restore));
title('restore Hologram angle');

%figure the hologram restoration:
figure(4);                                  
imagesc((abs(H_restore)));
title('restore Hologram amplitude');

