clear,clc;

% voc_2012_trainval
images = textread('data/VOCdevkit2012/VOC2012/ImageSets/Main/trainval.txt', '%s\n');
nimages = length(images);
boxes = cell(nimages, 1);
parfor i = 1:nimages
    d = load(['output/default/voc_2012_trainval/vgg16_fast_rcnn_iter_60000.caffemodel/', num2str(i-1)]);
    bbs = d.boxes;
    confs = d.scores;
    [s, A] = max(confs(:, 2:end), [], 2);
    inds = find(s >= 0.1);
    s = s(inds);
    A = A(inds);
    bb = zeros(length(inds), 4);
    for j = 1:length(inds)
        bb(j,:) = bbs(inds(j), A(j)*4+1:(A(j)+1)*4);
    end
    bb = [bb, s, A];
    boxes{i} = bb;
end
save('data/frcn_data/voc_2012_trainval.mat', 'boxes');

% voc_2012_test
images = textread('data/VOCdevkit2012/VOC2012/ImageSets/Main/test.txt', '%s\n');
nimages = length(images);
boxes = cell(nimages, 1);
parfor i = 1:nimages
    d = load(['output/default/voc_2012_test/vgg16_fast_rcnn_iter_60000.caffemodel/', num2str(i-1)]);
    bbs = d.boxes;
    confs = d.scores;
    [s, A] = max(confs(:, 2:end), [], 2);
    bb = zeros(length(A), 4);
    for j = 1:length(A)
        bb(j,:) = bbs(j, A(j)*4+1:(A(j)+1)*4);
    end
    bb = [bb, confs, A];
    boxes{i} = bb;
end
save('data/frcn_data/voc_2012_test.mat', 'boxes');