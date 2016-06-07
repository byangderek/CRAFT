clear,clc;
addpath('functions/nms/');

% voc_2012_trainval
load('output/rpn_cachedir/faster_rcnn_VOC2012_vgg_16layers_stage1_rpn/voc_2012_trainval/proposal_boxes_voc_2012_trainval.mat');
aboxes = aboxes(1:2:end); % do not use flipped proposals for simplicity
nimages = length(aboxes);
boxes = cell(nimages, 1);
parfor i = 1:nimages
    bbs = aboxes{i};
    keep = nms(bbs, 0.7, 1);
    boxes{i} = bbs(keep(1:min(end, 2000)), 1:4);
end
save('../2_CasRPN/data/rpn_data/voc_2012_trainval.mat', 'boxes');

% voc_2012_test
load('output/rpn_cachedir/faster_rcnn_VOC2012_vgg_16layers_stage1_rpn/voc_2012_test/proposal_boxes_voc_2012_test.mat');
nimages = length(aboxes);
boxes = cell(nimages, 1);
parfor i = 1:nimages
    bbs = aboxes{i};
    keep = nms(bbs, 0.7, 1);
    boxes{i} = bbs(keep(1:min(end, 2000)), 1:4);
end
save('../2_CasRPN/data/rpn_data/voc_2012_test.mat', 'boxes');