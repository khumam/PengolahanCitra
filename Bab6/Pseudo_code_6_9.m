clear all;
Im=double(imread('Lena.bmp'));     
figure(1), imshow(Im);                          
level=input('Masukan Jumlah level : '); 
                  % Hitung DWT sesuai jumlah level
if level>=1 
    [LL1, HL1, LH1, HH1]=dwthaar(Im(:,:,1));
end
if level>=2 
    [LL2, HL2, LH2, HH2]=dwthaar(LL1);
end
if level>=3 
    [LL3, HL3, LH3, HH3]=dwthaar(LL2);
end
                  % tampilkan citra hasil sesuai level
if level>=1 
    ImHasil=[uint8(LL1) abs(HL1)
                    abs(LH1) abs(HH1)];
end
if level>=2 
    ImHasil=[uint8(LL2) abs(HL2); 
                    abs(LH2) abs(HH2)];
    ImHasil=[ImHasil abs(HL1); 
                   abs(LH1) abs(HH1)];
end
if level>=3 
    ImHasil=[uint8(LL3) abs(HL3); 
                   abs(LH3) abs(HH3)];
    ImHasil=[ImHasil abs(HL2);  
                   abs(LH2) abs(HH2)];
    ImHasil=[ImHasil abs(HL1); 
                   abs(LH1) abs(HH1)];
end
 figure(2), imshow(((ImHasil)),[]);
 [LL1, HL1, LH1, HH1] = dwthaar(Im);
