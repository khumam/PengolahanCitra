clear all;
Im= double(imread('ImageEdgeGray.png'));      % baca citra gray-level
figure(1), imshow(uint8(Im));                 % tampilkan citra gray-level
 [N,M]=size(Im);         	                  % baca ukuran citra
                                     % Cara pertama menghitung gradien pixel per pixel
for n=1:N-1
    for m=1:M-1
        Gy(n,m)=abs(Im(n+1,m+1)-Im(n,m));     % gradien 45º
        Gx(n,m)=abs(Im(n,m+1)-Im(n+1,m));     % gradien 135º
        G(n,m) =sqrt(Gx(n,m)^2 + Gy(n,m)^2);  % gradien total citra
    end;
end;
figure(2), imshow(uint8(G));           % tampilkan gradien total
GR = imgradient(Im,'roberts');         % Cara kedua menghitung gradien Roberts
figure(3), imshow(uint8(GR*255));      % tampilkan gradien Roberts

