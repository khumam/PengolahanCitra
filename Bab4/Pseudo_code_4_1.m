clear all;
Im=double(imread('ImageEdgeGray.png '));  % baca citra gray-level
figure(1), imshow(uint8(Im));		  % tampilkan citra gray-level
 [N,M]=size(Im);			          % baca ukuran citra
	                   % Cara pertama menghitung gradien pixel per pixel
for n=1:N-1
    for m=1:M-1
        Gy(n,m)=abs(Im(n+1,m)-Im(n,m));             % hitung gradien x
        Gx(n,m)=abs(Im(n,m+1)-Im(n,m));             % hitung gradien y
        G(n,m) = sqrt(Gx(n,m)^2 + Gy(n,m)^2);  % hitung gradien citra
    end;
end;
figure(2), imshow(uint8(Gx));	% tampilkan gradien x
figure(3), imshow(uint8(Gy));	% tampilkan gradien y
figure(4), imshow(uint8(G));	% tampilkan gradien total
	       % Cara kedua hitung gradien menggunkan fungsi di Matlab
[Gx1,Gy1]=gradient(Im); 
G1=abs(Gx1) + abs(Gy1);         % hitung gradien citra
figure(5), imshow(uint8(G1));	% tampilkan gradien total

