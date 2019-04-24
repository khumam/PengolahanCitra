clear all;
I=imread('tekstur8.jpg');
[N,M,L]=size(I);
figure(1), imshow(I);title('Citra Asli');
His=imhist(I(:,:,1))/(N*M);

 Mean=0;
for zi=0:255     % Hitung Mean
    Mean=Mean+(zi*His(zi+1));
end

 Moment2=0;
for zi=0:255     % Moment orde-2
    Moment2=Moment2+((zi-Mean)^2*His(zi+1));
end
Moment2=Moment2^0.5;
              
R= Moment2^2/(1+Moment2^2);  % Smoothness atau Roughness
                  
S=0;           % Moment ke-3 atau Skewness
for zi=0:255
    S=S+((zi-Mean)^3*His(zi+1));
end
                 
U=0;           % Uniformity
for zi=0:255
    U=U+His(zi+1)^2;
end
                
Ent=0;         % Entropy
for zi=0:255
    if His(zi+1)>0
        Ent=Ent-(His(zi+1)*log2(His(zi+1)));
    end
end
Mean
Moment2
R
U
Ent