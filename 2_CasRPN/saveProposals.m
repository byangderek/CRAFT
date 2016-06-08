clear,clc;
addpath('../faster_rcnn/functions/nms/');

% voc_2012_trainval
images = textread('data/VOCdevkit2012/VOC2012/ImageSets/Main/trainval.txt', '%s\n');
nimages = length(images);
boxes = cell(nimages, 1);
parfor i = 1:nimages
    d = load(['output/CasRPN/voc_2012_trainval/vgg16_casRPN_iter_60000/', num2str(i-1)]);
    bbs = d.dets;
    keep = nms(bbs, 0.75, 1);
    boxes{i} = bbs(keep(1:min(end, 300)), 1:4);
end
save('data/casrpn_data/voc_2012_trainval.mat', 'boxes');

% voc_2012_test
images = textread('data/VOCdevkit2012/VOC2012/ImageSets/Main/test.txt', '%s\n');
nimages = length(images);
boxes = cell(nimages, 1);
parfor i = 1:nimages
    d = load(['output/CasRPN/voc_2012_test/vgg16_casRPN_iter_60000/', num2str(i-1)]);
    bbs = d.dets;
    keep = nms(bbs, 0.75, 1);
    nms_bbs = bbs(keep, :);
    [ss, sd] = sort(nms_bbs(:,5), 'descend');
    inds = find(ss >= 0.1);
    if length(inds) < 10
        inds = 1:10;
    end
    boxes{i} = nms_bbs(sd(inds), 1:4);
end
save('data/casrpn_data/voc_2012_test.mat', 'boxes');