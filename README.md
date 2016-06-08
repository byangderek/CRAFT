# README #

The codes are with the CVPR2016 paper ["CRAFT Objects from Images"](http://arxiv.org/abs/1604.03239).

In a word, we extend the conventional two-stage object detection framework (first locating object proposals, then classifying object categories) to a four-stage pipeline, in which the proposal localization task is solved with a cascade network of Region Proposal Network (RPN) and Fast R-CNN to improve the proposal quality, while the object classification task is handled by a cascade network of two Fast R-CNN nets with different objective functions (one-hot classification and one-vs-rest classification) to eliminate false positives.

We name our approach "CRAFT" (short for "Cascade Rpn And FasT-rcnn") and show considerable improvement over Fast R-CNN and Faster R-CNN baselines on PASCAL VOC 07/12 and ILSVRC datasets. For more details please refer to our [CVPR2016 paper](http://arxiv.org/abs/1604.03239).

The codes are built on [RPN](https://github.com/ShaoqingRen/faster_rcnn) (Stage 1) and [Fast R-CNN](https://github.com/rbgirshick/fast-rcnn) (Stage 2,3,4). It would be easier to use the codes if you are familiar with these two projects.

The codes are tested on Ubuntu 14.04, 256GB Memory, Titan X GPU, MATLAB R2015a.

### Preparation ###
1. Follow instructions in [Faster R-CNN](https://github.com/ShaoqingRen/faster_rcnn) to make the codes in `1_RPN`, using [Caffe](https://github.com/ShaoqingRen/caffe/tree/062f2431162165c658a42d717baf8b74918aa18e) provided by Shaoqing Ren
2. Follow instructions in [Fast R-CNN](https://github.com/rbgirshick/fast-rcnn) to make the codes in `2_CasRPN`, `3_FRCN`, and `4_CasFRCN`, using our slightly modified [Caffe](https://github.com/byangderek/caffe-fast-rcnn)
3. Download the VGG16 pre-trained model and PASCAL VOC 2012 dataset and make proper links pointing to them
4. You can create a soft link of folders `caffe-fast-rcnn` and `data` for `2_CasRPN`, `3_FRCN`, and `4_CasFRCN` for convenience.

### Training CRAFT on PASCAL VOC 2012 ###

The training process is stage-wise. For simplicity, we do not use joint training between RPN and Fast R-CNN networks.

**Stage 1. RPN**

1. run `1_RPN/experiments/script_faster_rcnn_VOC2012_VGG16.m` in MATLAB (note that there are in total 4 stages of training, while running only first stage of RPN is enough here)

2. run `1_RPN/saveProposals.m` in MATLAB

**Stage 2. CasRPN**

**Stage 3. FRCN**

**Stage 4. CasFRCN**

### Results on PASCAL VOC 2012 ###


### Reference ###

If you use our codes in your research, we are grateful if you cite the paper:

```
@inproceedings{binyang16craft,
  title={Craft Objects from Images},
  author={Yang, Bin and Yan, Junjie and Lei, Zhen and Li, Stan},
  booktitle={Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition},
  year={2016}
}
```

### Acknowledgement ###

We give our sincere gratitude to the following people, groups and institutions:

* Anonymous reviewers
* Ross Girshick for the Fast R-CNN project
* Shaoqing Ren for the Faster R-CNN project
* Caffe team
* VGG team
* SenseTime Group
* NVIDIA Corporation
