clear all;
I=imread('Noisegray50%Gaussian.png');  % Baca citra
                                       % Hitung koefisien filter LoG
s = input('Masukan nilai standar deviasi : ');
A = -(1/(pi*s^4));
C = (2*s^2);
for i=1:11
    for j=1:11
        D= -((i-6)^2 + (j-6)^2)/C;
        b(i,j) = double(A*(1+D)*exp(D));
    end
end
                                   % Deteksi tepi citra I menggunakan proses konvolusi
Iprim = abs(conv2(double(I),b,'same'));
                                                               
figure(1), imshow(I);              %Tampilkan citra asli dan hasilnya
figure(2), imshow(uint8(Iprim));
