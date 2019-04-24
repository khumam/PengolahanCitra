clear all;
Im= double(imread('ImageEdgeGray.png')); % baca citra gray-level
figure(1), imshow(uint8(Im));        % tampilkan citra gray-level
 [N,M]=size(Im);         	         % baca ukuran citra
G1 = [5,5,5;-3,0,-3;-3,-3,-3];	     % Set matriks operator Kirsch
G2 = [-3,5,5;-3,0,5;-3,-3,-3];
G3 = [-3,-3,5;-3,0,5;-3,-3,5];
G4 = [-3,-3,-3;-3,0,5;-3,5,5];
G5 = [-3,-3,-3;-3,0,-3;5,5,5];
G6 = [-3,-3,-3;5,0,-3;5,5,-3];
G7 = [5,-3,-3;5,0,-3;5,-3,-3];
G8 = [5,5,-3;5,0,-3;-3,-3,-3];
 	                                 % Penghitung gradien Kirch melalui konvolusi
Gs1=abs(conv2(Im,G1,'same'))/15;
Gs2=abs(conv2(Im,G2,'same'))/15;
Gs3=abs(conv2(Im,G3,'same'))/15;
Gs4=abs(conv2(Im,G4,'same'))/15;
Gs5=abs(conv2(Im,G5,'same'))/15;
Gs6=abs(conv2(Im,G6,'same'))/15;
Gs7=abs(conv2(Im,G7,'same'))/15;
Gs8=abs(conv2(Im,G8,'same'))/15;
for n=1:N
    for m=1:M
    GS(n,m)=max(max(max(max(max(max(max(Gs1(n,m),Gs2(n,m)),Gs3(n,m)),...
            Gs4(n,m)),Gs5(n,m)),Gs6(n,m)),Gs7(n,m)),Gs8(n,m));
    end
end
figure(2), imshow(uint8(GS));       % tampilkan gradien total

