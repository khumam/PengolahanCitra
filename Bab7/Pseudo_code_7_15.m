clear all;
Fig=figure(1); 
vid = videoinput('winvideo',1,'MJPG_320x240');   % aquisisi video dengan format MJPG_640x480
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);    trigger(vid);                     % mulai akuisisi video
Stop=1;                                          % set kondisi stop akuisisi
im1= (getdata(vid,1));
while (Stop>0)                                   % lakukan loop akusisi hingga kondisi stop=0 
    trigger(vid);                                % akuisisi satu frame
    im2= getdata(vid,1);                         % baca data citra dari frame video      
    if  ishandle(Fig)==0                         % jika window tampilan ditutup
        Stop=0;
    else                                         % jika window tampilan belum ditutup
       Edif = abs(im1-im2);                      % hitung kesamaan pixel
       figure(1),imshow(uint8(Edif));
       drawnow                                   % update figure window
       im1=im2;
    end
 end
stop(vid);                                       % stop akuisisi
delete(vid);                                     % hapus semua frame
clear vid;                                       % hapus variable vid
