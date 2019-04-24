clear all;
Im= double(imread('ImageEdgeGray.png'));    % baca citra gray-level
figure(1), imshow(uint8(Im));           % tampilkan citra gray-level
 [N,M]=size(Im);         	            % baca ukuran citra
                    % Cara pertama menghitung gradien Sobel dan Prewitt melalui konvolusi
Sx = [-1,-2,-1;0,0,0;1,2,1];	        % set matriks operator Sobel arah x
Sy = [-1,0,1;-2,0,2;-1,0,1];	        % set matriks operator Sobel arah y
Px = [-1,-1,-1;0,0,0;1,1,1];	        % set matriks operator Prewitt arah x
Py = [ -1,0,1; -1,0,1 ; -1,0,1]; 	    % set matriks operator Prewitt arah y
Gsx=conv2(Im,Sx,'same');	            % konvolusi operator Sobel x dan citra
Gsy=conv2(Im,Sy,'same');	            % konvolusi operator Sobel y dan citra
GS = abs(Gsx) + abs(Gsy);	            % hitung gradien total Sobel
figure(2), imshow(uint8(GS));           % tampilkan gradien Sobel
 Gpx=conv2(Im,Px,'same');	            % konvolusi operator Prewitt x dan citra
Gpy=conv2(Im,Py,'same');	            % konvolusi operator Prewitt y dan citra
GP = abs(Gpx) + abs(Gpy);	            % hitung gradien Prewitt
figure(3), imshow(uint8(GP));           % tampilkan gradien Prewitt
         % Cara kedua menghitung gradien Sobel dan Prewitt dengan fungsi imgradient ()
GS1 = imgradient (Im,'sobel');	        % hitung gradien Sobel
GP1 = imgradient(Im,'prewitt');	        % hitung gradien Prewitt
figure(4), imshow(uint8(GS1));          % tampilkan gradien Sobel
figure(5), imshow(uint8(GP1));          % tampilkan gradien Prewitt


