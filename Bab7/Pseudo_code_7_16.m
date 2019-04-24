clear all;
Fig=figure(1); 
vid = videoinput('winvideo',1,'MJPG_320x240');   % aquisisi video dengan format MJPG_640x480
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                      % mulai akuisisi video
trigger(vid);                                    % akuisisi satu frame
Stop=1;                                          % set kondisi stop akuisisi
im1= (getdata(vid,1));
[N,M,L]=size(im1);  Edef=zeros(N, M, L);
 while (Stop>0)                                  % lakukan loop akusisi hingga kondisi stop=0 
    trigger(vid);                                % akuisisi satu frame
    im2= getdata(vid,1);                         % baca data citra dari frame video      
    if  ishandle(Fig)==0                         % jika window tampilan ditutup
        Stop=0;
    else                                         % jika window tampilan belum ditutup
       for n=1:4:N-4                             % hitung kesamaan blok pixel
          for m=1:4:M-4
           Mob(n:n+3,m:m+3,:)=abs(im1(n:n+3,m:m+3,:)-im2(n:n+3,m:m+3,:));  
          end
      end
       figure(1), imshow(uint8(Mob));
       drawnow                                   % update figure window
       im1=im2;
    end
 end
stop(vid);                                       % stop akuisisi
delete(vid);                                     % hapus semua frame
clear vid;                                       % hapus variable vid
