clc
clear
close all

Im1 = imread('HistEq1.jpg');
Img1 = rgb2gray(Im1);
imhist(Img1);
J1 = histeq(Img1);
figure(1);imshowpair(Img1,J1,'montage');

Im2 = imread('HistEq2.jpg');
Img2 = rgb2gray(Im2);
imhist(Img2);
J2 = histeq(Img2);
figure(2);imshowpair(Img2,J2,'montage');
% 
Im3 = imread('HistEq3.jpg');
Img3 = rgb2gray(Im3);
imhist(Img3);
J3 = histeq(Img3);
figure(3);imshowpair(Img3,J3,'montage');