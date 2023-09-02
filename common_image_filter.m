%note uncomment montage to view result
img=imread("rice.png");
imsimpleadjust=imadjust(img);
imgsimplebinarize=imbinarize(imsimpleadjust);
% Blurring Filters for Noise and Detail Removal
% Average Filter
% This is the simplest blurring filter.  It calculates the average value of the pixels covered by the filter.  
% The average filter has one optional input
% hsize, an integer (or vector of two integers for non-square filters) specifying the size of the filter matrix.  The default value is 3.
           %Average Filter
fAverage = fspecial("average",[3,3])  %take average
imgAveraged = imfilter(img, fAverage); %apply filter
imadsmooth=imadjust(imgAveraged);
imbinarize_smooth=imbinarize(imadsmooth);

%montage({img,imgsimplebinarize,imbinarize_smooth});

        %Disk Filter
% This creates a disk-shaped averaging filter.  The disk shape includes only physically close pixels, and tapers to zero near the edge of the disk.
% The disk filter has one optional input
% radius, an integer specifying the radius of the disk-shaped filter.  The filter is a square matrix of size 2*radius+1.  The default value is 5.        

fDisk = fspecial("disk",3)   %2*radius+1
filter_Disk=imfilter(img,fDisk);
%%montage({img,filter_Disk});

% Gaussian Filter
% Gaussian filters are the preferred method of blurring an image before performing other processing steps, such as edge detection.  The Gaussian filter is edge preserving, meaning smaller details can be removed without degrading the larger details, such as the edges of items.  

fGaussian = fspecial("gaussian",[3,3],0.5)  %the standard deviation of the Gaussian function used to create the filter.  The default value is 0.5.
imgGaussian = imfilter(img, fGaussian);
%%montage({img, imgGaussian})

imgGaussFilt = imgaussfilt(img,[3,3])  %imgaussfilt is recommended
imadjgasuss=imadjust(imgGaussFilt);
imbinarize_gauss=imbinarize(imadjgasuss);

montage({img,imgGaussFilt,imbinarize_gauss})

%Blurring Filter for General Image Manipulation
fMotion = fspecial("motion",9,0)
imgMotion = imfilter(img, fMotion);
imadj=imadjust(imgMotion);
imbinarizee=imbinarize(imadj)

fMotion1 = fspecial("motion",7,45)
imgMotion1 = imfilter(img, fMotion);

imadj1=imadjust(imgMotion1);
imbinarizee1=imbinarize(imadj1)
%%montage({img, imgMotion,imgMotion1,imbinarizee,imbinarizee1})

%Edge Detection Filters
% Sobel
fSobel = fspecial("sobel");
imgSobel = imfilter(img, fSobel);
%montage({img, imgSobel})

%Prewitt
fPrewitt = fspecial("prewitt");
imgPrewitt = imfilter(img, fPrewitt);
%montage({img, imgPrewitt})

%Laplacian
fLaplacian = fspecial("laplacian",0.2) %alpha:  the shape of the Laplacian.  Takes values in the range [0, 1], with a default of 0.2.
imgLaplacian = imfilter(img, fLaplacian);
%montage({img, imgLaplacian})

%for median filter use to remove noises
img=imread("noisy.jpg");
imgMed = medfilt2(img);
montage({img, imgMed})



























