clear all;
I=imread('Noisegray50%Gaussian.png');   % Baca citra
                                      % Hitung koefisien filter turunan pertama Gaussian
s = input('Masukan nilai standar deviasi : ');
A = -(1/(2*pi*s^4));
C = (2*s^2);
for i=1:7
    for j=1:7
        bx(i,j) = (i-4)*A*exp(-((i-4)^2 + (j-4)^2)/C);
        by(i,j) = (j-4)*A*exp(-((i-4)^2 + (j-4)^2)/C);
    end
end
                                   % Deteksi tepi citra I menggunakan proses konvolusi
Iprim = abs(conv2(double(I),bx,'same')) + abs(conv2(double(I),by,'same'));
figure(1), imshow(I);              % Tampilkan citra asli dan hasilnya
figure(2), imshow(uint8(Iprim));

