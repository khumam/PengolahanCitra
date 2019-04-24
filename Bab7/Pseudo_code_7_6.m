clear all;
figure(1);
global movie name vid;
vid = videoinput('winvideo',1,'MJPG_320x240');   % aquisisi video dengan format MJPG_320x240
set(vid,'FramesPerTrigger',1);                   % set jumlah frame setiap akuisisi = 1
set(vid,'TriggerRepeat', Inf);                   % set akuisisi video secara berulang
triggerconfig(vid, 'Manual');
name ='Cuplikan_Video.mp4';                      % set nama file 
movie=VideoWriter(name,'MPEG-4');                % set format file video: kompresi MPEG-4
movie.FrameRate=12;                              % set frame rate visualisasi: 12 frame/detik
movie.Quality=100;                               % set kualitas kompresi
open(movie);                                     % buka file MPEG-4
start(vid);                                      % mulai akuisisi video
Nf=25;
for k=1:Nf                                       % loop akuisisi Nf kali 
    trigger(vid);                                % akuisisi satu frame
    im= getdata(vid,1);                          % baca data citra dari frame video
    imshow(im);                                  % tampilkan citra
    drawnow                                      % update figure window
    writeVideo(movie,im);                        % tambahkan frame citra kedalam file MPEG-4
end
stop(vid);                                       % stop akuisisi
delete(vid);  clear vid;                         % hapus semua frame dan hapus variable vid
close(movie);                                    % tutup file MPEG-4
