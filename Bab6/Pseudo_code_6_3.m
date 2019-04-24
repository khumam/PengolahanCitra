%function [Y Cb Cr] = trans_warna_sampling (RGB, format)
clear all;
RGB=imread('images.png');         % baca citra
figure(1), imshow(RGB);
format=420;                       % set format sampling
YCbCr=rgb2ycbcr(RGB);             % konversi warna
Y = YCbCr(:,:,1);                 % komponen Y citra
if format == 444
   Cb = YCbCr(:,:,2);             % komponen Cb format 4:4:4
   Cr = YCbCr(:,:,3);             % komponen Cr format 4:4:4
elseif  format == 422
    Cb=YCbCr(:,1:2:end,2);        % komponen Cb format 4:2:2
    Cr=YCbCr(:,1:2:end,3);        % komponen Cr format 4:2:2
elseif  format == 411
    Cb=YCbCr(:,1:4:end,2);        % komponen Cb format 4:1:1
    Cr=YCbCr(:,1:4:end,3);        % komponen Cr format 4:1:1
elseif  format == 420
    Cb=YCbCr(1:2:end,1:2:end,2);  % komponen Cb format 4:2:0
     Cr=YCbCr(1:2:end,1:2:end,3); % komponen Cr format 4:2:0
end
   figure(2), imshow(Y);          % tampilkan komponen Y citra 
   figure(3), imshow(Cb);         % tampilkan komponen Cb citra
   figure(4), imshow(Cr);         % tampilkan komponen Cr citra
