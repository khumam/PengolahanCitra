clear all;
R(1:256,1:30,1:3)=0;                      % Inisialisasi matriks palette warna R, G, B
G(1:256,1:30,1:3)=0;  B(1:256,1:30,1:3)=0;
Ir(1:256)=0;                                   % Inisialisasi vektor index warna R, G, B
Ig(1:256)=0; Ib(1:256)=0;
Q=10;                                             % Set jumlah kuantisasi
hitam=15;                                       % Set intensitas warna hitam
Th=(255-hitam)/(Q-1);                  % Hitung nilai delta atau Th
for i=255:-1:hitam
    Indeks=ceil((i-hitam)/Th);       % Hitung nilai indeks warna
    Ir(256-i)=Indeks;                 
    Ig(256-i)=Indeks;   Ib(256-i)=Indeks;
    WarnaIndeks=Indeks*Th;       % Hitung nilai intensitas warna indeks
    R(256-i,1:30,1)=WarnaIndeks;
    G(256-i,1:30,2)=WarnaIndeks;
    B(256-i,1:30,3)=WarnaIndeks;
end
figure(1), imshow(uint8(R));       % Tampilkan peta warna atau palette warna
figure(2), imshow(uint8(G));  figure(3), imshow(uint8(B));
