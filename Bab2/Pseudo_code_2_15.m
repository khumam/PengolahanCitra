%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Transformasi Geometri: Penskalaan Citra       %%%
%%%  digunakan untuk citra berwarna, gray-level dan biner  %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan             %%%
%%%  Citra dan Video Digital: Teori, Aplikasi              %%%
%%%  dan Pemrograman Matlab",2015.                         %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
I=imread('image4.png');        %  Baca file citra 'images.jpg' dan simpan pada matriks I
figure(1), imshow(I);		   % tampilkan citra I
[N,M,K]=size(I);			   % baca ukura citra I
Sx=input('masukan nilai skala horisontal : ');   %  masukan nilai skala horisontal
Sy=input('masukan nilai skala vertikal : ');     %  masukan nilai skala horisontal
S = [Sx 0 0; 0 Sy 0; 0 0 1 ];                    %  set matiks scaling S
Is(1: round(Sy*N),1: round(Sx*M),1:K)=0;         %  set Matriks untuk citra hasil scaling Is
i=1; 
for y=1:N
    j=1;
    for x=1:M
        v=[x; y; 1];
        V=round(S*v);                            % hitung koodinat scaling
        for k=1:K
            Is(i:V(2,1),j:V(1,1),k)=I(y,x,k);    % transfer nilai warna pixel pada posisi x,y 
        end                                      % kedalam blok posisi (i:V(2,1),j:V(1,1)) matrksi Is
        j=V(1,1)+1;
    end
    i=V(2,1)+1;
end
 figure(2), imshow(uint8(Is));       % tampilkan citra hasil scaling Is
IsM = imresize(I, 0.5);              % proses scaling menggunkan fungsi scaling citra di Matlab
 figure(4), imshow(uint8(IsM));      % tampilkan citra hasil rotasi IsM
 
