vid = videoinput('winvideo',1,'MJPG_640x480');   % aquisisi video dengan format MJPG_640x480
set(vid,'FramesPerTrigger',100);                 % set jumlah frame yang akan diakuisisi: 100
start(vid);                                      % mulai akuisisi video
wait(vid,Inf);                                   % tunggu hingga selesai
[frames,time] = getdata(vid, get(vid,'FramesAvailable'));    % baca waktu akuisisi untuk 100 frame
framerate = mean(1./diff(time))                  % hitung frame rate
stop(vid);                                       % stop akuisisi
delete(vid);                                     % hapus semua frame
clear vid;                                       % hapus variable vid
