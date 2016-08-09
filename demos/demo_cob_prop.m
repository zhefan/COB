
%% Demo to show the results of COB Proposals
clear all;close all;home;

% Read an input image
I = imread(fullfile(cob_root,'demos','color.png'));

% Compute the proposals
[proposals_cob, ucm2_cob, times] = im2prop(I);

% Display timing
fprintf('Timing: \n + Boundaries %0.3f s\n + UCMs       %0.3f s\n + Proposals  %0.3f s\n', times.boundaries, times.ucms, times.proposals)

%% Show UCM results (dilated for visualization)
figure;
subplot(1,2,1)
imshow(I), title('Image')

subplot(1,2,2)
imshow(imdilate(ucm2_cob,strel(ones(3))),[]), title('COB UCM')

%% Show Object Candidates results and bounding boxes
% Candidates in rank position 1 and 4
% id1 = 1; id2 = 4;

figure
subplot(1,3,1)
I = im2double(I);
imshow(I), title('Image')
for i = 1:10
    
    % Get the masks from superpixels and labels
    mask = ismember(proposals_cob.superpixels, proposals_cob.labels{i});
%     mask2 = ismember(proposals_cob.superpixels, proposals_cob.labels{id2});
    temp_img1 = zeros(size(I));
    temp_img2 = zeros(size(I));
    for j = 1:size(I,3)
        temp_img1(:,:,j) = I(:,:,j) .* double(1-mask) .* 0.1;
        temp_img2(:,:,j) = I(:,:,j) .* double(mask);
    end
    % Show results
    subplot(1,3,2)
    imshow(mask), title('FG Mask')
    subplot(1,3,3)
    imshow(temp_img1+temp_img2), title('Proposal')
    pause
end
