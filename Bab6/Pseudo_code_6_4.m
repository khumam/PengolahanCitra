%function [ImDCT] = blok_proses_DCT (Im)
clear all;
Im=imread('images.png');    % baca citra
n=3;                        % set ukuran blok
B=2^n;                                  
[Mf,Nf,L]=size(Im);         % baca ukuran citra
mb=mod(Mf,B);               % cek kelipatan B=0
nb=mod(Nf,B);
%%  Penambahan ukuran citra agar menjadi kelipatan ukuran blok (8x8)
if nb>0                     % jika tidak, tambah kolom
    Im(:,Nf+1:Nf+(B-nb),:)= 0;
end
if mb>0                     % jika tidak, tambah baris
    Im(Mf+1:Mf+(B-mb),:,:)= 0;
end
%%
imshow(Im);                % tampilkan citra

%%  Cara pembacaan citra blok per blok
[Mf,Nf,L]=size(Im);        % baca ukuran baru 
mb=Mf/B;                   % banyaknya blok arah x
nb=Nf/B;                   % banyaknya blok arah y
for l=1:L                  % loop pembacaan blok
  for i=1:mb
    for j=1:nb
      m1=B*(i-1)+1; m2=B*i;
      n1=B*(j-1)+1; n2=B*j;
      BlokBxB=Im(m1:m2, n1:n2, l);  % baca citra Im  per blok 8x8
      
    end
  end
end
%%
