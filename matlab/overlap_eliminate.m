function Img = overlap_eliminate( Img1, Img2)
%Eliminate the overlapped areas of Image1.
Ins1 = zeros(size(Img1));
over_area = double(rgb2gray(Img1)>0 & rgb2gray(Img2)>0);
for c = 1:size(Img1,3)
     I_tmp1 = Img1(:,:,c);
     I_tmp2 = Img2(:,:,c);
     Ins1(:,:,c) = double(I_tmp1).* over_area;
end
 Img = double(Img1) -Ins1;
end

