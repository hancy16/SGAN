clearvars;close all;clc;
camera_angle = 100;
views     = {'Omni_F'; 'Omni_L'; 'Omni_B'; 'Omni_R'};
position  = {[0,0],[0,pi/2],[0,pi],[0,-pi/2]};
img_path  = './SYNTHIA-SEQS-05-SUMMER/RGB/Stereo_Left/';
img_list  = dir(fullfile(img_path,views{1}));
img_nlist = {img_list(cell2mat({img_list.isdir})==0).name};
%save dir
savepath = './SYNTHIA-SEQS-05-SUMMER/RGB/full_Stereo_Left/';
if ~exist(savepath,'dir')
        mkdir(savepath);
end
    
for i = 1:length(img_nlist)
    %spherical project
    for view = 1 : length(views)
       img_name = fullfile(img_path,views{view},img_nlist{i});
       I = imread(img_name);
       I = imresize(I,0.5);
       Image{view}= sphere_project(I,position{view},camera_angle);   
    end
    %overlap eliminate
    fullimage = zeros(size(Image{1}));
    for view = 1 : length(views)
       fullimage = fullimage + overlap_eliminate(Image{view},Image{mod(view,length(views))+1});     
    end
    %save images 
    imwrite(uint8(fullimage),fullfile(savepath,img_nlist{i}));
    fprintf('processing %d images\n',i);
end