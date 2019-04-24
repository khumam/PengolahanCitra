clear all;
I= double(imread('Noisegray50%Gaussian.png'));   % Baca citra
                                                 % Hitung koefisien filter DoG
s1 = input('Masukan nilai standar deviasi 1 : ');  % Nilai deviasi pertama
s2 = input('Masukan nilai standar deviasi 2 : ');  % Nilai deviasi kedua
A1 = (1/(2*pi*s1^2));  A2 = (1/(2*pi*s2^2));
C1 = (2*s1^2);  C2 = (2*s2^2);
for i=1:9
    for j=1:9
        G1(i,j) =  A1*exp(-((i-5)^2 + (j-5)^2)/C1);
        G2(i,j) =  A2*exp(-((i-5)^2 + (j-5)^2)/C2);
    end
end 
Idog1 = conv2(I, G1, 'same');          % Proses konvolusi  I*G1
Idog2 = conv2(I, G2, 'same');          % Proses konvolusi  I*G2
Idog = abs(Idog1 - Idog2);            % Proses Difference of Gaussian
figure(1), imshow(uint8(I));                  % Tampilkan citra asli dan hasilnya
figure(2), imshow(uint8(Idog));
