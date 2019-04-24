%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Program Transformasi Geometri: Rotasi Citra           %%%
%%%  digunakan untuk citra berwarna, gray-level dan biner  %%%
%%%  Sarifuddin Madenda untuk buku "Pengolahan             %%%
%%%  Citra dan Video Digital: Teori, Aplikasi              %%%
%%%  dan Pemrograman Matlab",2015.                         %%%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
I=imread('image4.png');	  %  Baca file citra 'images.jpg' dan simpan pada matriks I
figure(1), imshow(I);	  % tampilkan citra I
[N,M,L]=size(I);		  % baca ukura citra I
sudut=input('masukan nilai sudut rotasi dalam derajat : ');      % masukan nilai sudut rotasi
th=2*pi*sudut/360;                                     % konversi derajat ke radian
R = [ cos(th) -sin(th) 0; sin(th) cos(th) 0; 0 0 1 ];  % set matriks transformasi rotasi
M0=R*[0; 0; 1];                                        % hitung ukuran matriks rotasi
M1=R*[0; N; 1];
M2=R*[M; 0; 1];
M3=R*[M; N; 1];
Mmin=(1+abs(min([M0(1,1) M1(1,1) M2(1,1) M3(1,1)]))) ;   % koordinat M minimum
Mmax=(1+abs(max([M0(1,1) M1(1,1) M2(1,1) M3(1,1)])));    % koordinat M maksimum
Nmin=(1+abs(min([M0(2,1) M1(2,1) M2(2,1) M3(2,1)]))) ;   % koordinat N minimum
Nmax=(1+abs(max([M0(2,1) M1(2,1) M2(2,1) M3(2,1)])));    % koordinat N maksimum
Kmin=[Mmin; Nmin; 1];                                    % Set vector koodinat rotasi minimum 
Ir(1:round(Nmin+Nmax),1:round(Mmin+Mmax),1:L)=0;         % set matriks citra rotasi 
for y=1:N                                        % mulai proses rorasi pixel per pixel
    for x=1:M
        v=[x; y; 1];
        V=round((R*v)+Kmin);                     %  hitung koordinat rotasi        
        Ir(V(2,1),V(1,1),1:L)=I(y,x,1:L);        % simpan nilai pixel pada koordinat rotasi
    end
end                                         % proses rotasi selesai
figure(2), imshow(uint8(Ir));               % tampilkan citra hasil rotasi Ir
 IrM = imrotate(I,-sudut,'bilinear');       % proses rotasi menggunkan fungsi di Matlab
 figure(3), imshow(uint8(IrM));             % tampilkan citra hasil rotasi Ir
 
