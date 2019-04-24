clear all;
I=double(imread('Noise50%Gaussian.png')); % Baca citra Noise50%Gaussian 
B=[1 1 1; 1 1 1; 1 1 1];          % Set matriks B dengan elemen 8 connectivity
Close = imclose(I,B);             % Operasi closing terhadap citra I
Open = imopen(Close,B);           % Operasi opening terhadap hasil closing
figure(1), imshow(uint8(I));      % Tampilkan citra asli
figure(2), imshow(uint8(Open));   % Tampilkan citra hasilnya OoC
