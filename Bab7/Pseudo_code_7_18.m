function Pseudo_code_7_18()
Fig=figure(1);
GoP=9;  NG=20;  N=NG*GoP + 1;                     % set jumlah frame yang akan diakuisisi
vid = videoinput('winvideo',1,'YUY2_320x240');    % aquisisi video format YUY2_320x240
set(vid,'FramesPerTrigger',N);                    % set jumlah frame yang akan diakuisisi: 100
start(vid);                                       % mulai akuisisi video
wait(vid,Inf);                                    % tunggu hingga selesai
[frames,time] = getdata(vid, get(vid,'FramesAvailable'));    % baca frame video
for i=1:GoP:N-1                                              % loop akuisisi 150 kali                                                                            
   I = double(frames(:,:,1,i));
   P1 = double(frames(:,:,1,i) - frames(:,:,1,i+3)); 
   jum= (double(frames(:,:,1,i)) + double(frames(:,:,1,i+3)))/2;
   B1 = double(frames(:,:,1,i+1)) - jum;
   B2 = double(frames(:,:,1,i+2)) - jum;
   P2 = double(frames(:,:,1,i+3) - frames(:,:,1,i+6)); 
   jum= (double(frames(:,:,1,i+3)) + double(frames(:,:,1,i+6)))/2;
   B3 = double(frames(:,:,1,i+4)) - jum;
   B4 = double(frames(:,:,1,i+5)) - jum;
   jum= (double(frames(:,:,1,i+6)) + double(frames(:,:,1,i+GoP)))/2;
   B5 = double(frames(:,:,1,i+7)) - jum;
   B6 = double(frames(:,:,1,i+8)) - jum;
   Ip = double(frames(:,:,1,i+GoP));
   tampil(Fig, I, B1, B2, P1, B3, B4, P2,B5, B6, Ip);
   %[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10] = rekonstruksi(I,B1,B2,P1,B3,B4,P2,B5,B6,Ip);
   %tampil(Fig, I1,I2,I3,I4,I5,I6,I7,I8,I9,I10);
end
stop(vid);                                              % stop akuisisi
delete(vid);                                            % hapus semua frame
clear vid;        
end
                                               % tampil frame I, B dan P
function tampil(Fig, I, B1, B2, P1, B3, B4, P2,B5, B6, Ip)
subplot(3,4,1), imshow(uint8(I));             subplot(3,4,2), imshow(uint8(abs(B1)));
subplot(3,4,3), imshow(uint8(abs(B2)));  subplot(3,4,4), imshow(uint8(abs(P1)));
subplot(3,4,5), imshow(uint8(abs(B3)));  subplot(3,4,6), imshow(uint8(abs(B4)));
subplot(3,4,7), imshow(uint8(abs(P2)));   subplot(3,4,8), imshow(uint8(abs(B5)));
subplot(3,4,9), imshow(uint8(abs(B6)));   subplot(3,4,10), imshow(uint8(abs(Ip)));
drawnow;
truesize,
end
                                    % Rekonstruksi
function  [I1, I2, I3, I4, I5, I6, I7, I8, I9, I10] = rekonstruksi(I, B1, B2, P1, B3, B4, P2,B5, B6, Ip)
   I1 = I;
   I4 = I1 - P1; 
   jum= (I1 + I4)/2;
   I2 = B1 + jum;
   I3 = B2 + jum;
   I7 = I4 - P2; 
   jum= (I4 + I7)/2;
   I5 = B3 + jum;
   I6 = B4 + jum;
   I10= Ip;
   jum= (I7 + I10)/2;
   I8 = B5 + jum;
   I9 = B6 + jum;
end
