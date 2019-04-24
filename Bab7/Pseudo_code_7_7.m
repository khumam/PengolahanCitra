clear all;      %%% visualisasi cara pertama
videoFReader = vision.VideoFileReader('Cuplikan_Video.mp4');  % Baca file video MPEG_4
videoPlayer = vision.VideoPlayer;                             % Inisalisasi GUI video player
while ~isDone(videoFReader)                      % lakukan secara berulang hingga frame terakhir
  videoFrame = step(videoFReader);               % baca frame 
  step(videoPlayer, videoFrame);                 % tampilkan frame pada GUI video player
end
release(videoPlayer);                            % hentikan GUI video player
release(videoFReader);                           % kosongkan memori videoFReader 

clear all;                   %%% visualisasi cara kedua
videoReader = VideoReader('Cuplikan_Video.mp4');  % baca file video MPEG_4
numFrames = videoReader.NumberOfFrames;           % baca jumlah frame video
Fig=figure(1);
for i=1:numFrames                                 % lakukan secara berulang hingga frame terakhir
   videoFrame = read(videoReader,i);              % baca frame
    imshow(videoFrame);                           % tampilkan frame citra
    drawnow                                       % update figure window
end

clear all;                   %%% visualisasi cara ketiga
vidObj = mmreader('Cuplikan_Video.mp4');          % baca file video MPEG_4
numFrames = vidObj.NumberOfFrames;                % baca jumlah frame video 
videoPlayer = vision.VideoPlayer;                 % Inisalisasi GUI video player
for i=1:numFrames
  videoFrame = read(vidObj,i);                    % baca frame
  step(videoPlayer, videoFrame);                  % tampilkan frame pada GUI video player
end
release(videoPlayer);                             % hentikan GUI video player
