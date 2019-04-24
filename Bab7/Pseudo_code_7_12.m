clear all;
Fig=figure(1);
vid = videoinput('winvideo',1,'MJPG_640x480');   % aquisisi video dengan format MJPG_640x480
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);
triggerconfig(vid, 'Manual');
start(vid);                                      % mulai akuisisi video
Stop=1;                                          % set kondisi stop akuisisi
 while (Stop>0)                                  % lakukan loop akusisi hingga kondisi stop=0 
    trigger(vid);                                % akuisisi satu frame
    im= getdata(vid,1);                          % baca data citra dari frame video      
    if  ishandle(Fig)==1                         % jika window tampilan belum ditutup
        imEq= histeq(im(:,:,1));        % histogram equalization: koreksi kecerahan komponen R
        imEq(:,:,2)= histeq(im(:,:,2)); % histogram equalization: koreksi kecerahan komp. G
        imEq(:,:,3)= histeq(im(:,:,3)); % histogram equalization: koreksi kecerahan komp. B
        imshow(uint8(imEq),[]);                  % tampilkan citra hasil histogram equalization. 
        drawnow                                  % update figure window
    else                                         % jika window tampilan sudah ditutup
        Stop=0;                                  % stop loop
    end
 end
stop(vid);                                       % stop akuisisi
delete(vid);                                     % hapus semua frame
clear vid;                                       % hapus variable vid


