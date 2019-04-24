clear all;
I=double(imread('Noise50%Gaussian.png'));   % Baca citra Noise50%Gaussian 
[N,M]=size(I);
B=[1 1 1; 1 1 1; 1 1 1];            % Set matriks B dengan elemen 8 connectivity
Open=imopen(I,B);                   % Operasi opening terhadap citra I
Close=imclose(Open,B);              % Operasi closing terhadap hasil opening
figure(1), imshow(uint8(I));        % Tampilkan citra asli
figure(2), imshow(uint8(Close));    % Tampilkan citra hasilnya CoO
