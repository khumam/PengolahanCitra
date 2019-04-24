clear all;                                   
videoReader = VideoReader('Cuplikan_Video.mp4');           % baca file video MPEG_4
numFrames = videoReader.NumberOfFrames;                    % baca jumlah frame video
Fig=figure(1);
for i=1:numFrames                                          % lakukan secara berulang hingga frame terakhir
        im = read(videoReader,i);                          % baca frame
        Gradien= imgradient(im(:,:,1),'prewitt');          % hitung gradien Prewitt komponen R
        Gradien (:,:,2)= imgradient(im(:,:,2),'prewitt');  % hitung gradien Prewitt komponen G
        Gradien (:,:,3)= imgradient(im(:,:,3),'prewitt');  % hitung gradien Prewitt komponen B
        imshow(uint8(Gradien));                            % tampilkan tepi citra
        drawnow                                            % update figure window
end
