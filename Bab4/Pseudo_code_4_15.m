clear all;
I=double(imread('ImageEdgeGray.png'));   % Baca citra gray-level 
B=[1 1 1; 1 1 1; 1 1 1];                % Set matriks B dengan elemen 8 connectivity
Erosi=imerode(I,B);                     % Operasi erosi terhadap citra I
Dilasi=imdilate(I,B);                   % Operasi dilasi terhadap citra I
Tepi_DID=abs(I- Dilasi);                % Operasi selisi citra I terhadap hasil erosi
Tepi_DIE=abs(I-Erosi);                  % Operasi selisi citra I terhadap hasil dilasi
Tepi_DDE=abs(Dilasi-Erosi);             % Selisi citra hasil dilasi terhadap  hasil erosi               
figure(1), imshow(uint8(I));            % Tampilkan citra asli dan hasil tepi citra
figure(2), imshow(uint8(Tepi_DID));
figure(3), imshow(uint8(Tepi_DIE));
figure(4), imshow(uint8(Tepi_DDE));

