#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

LOG="casfrcn_train_12trainval_vgg16.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time  ./tools/train_net.py --gpu 0 \
  --solver models/VGG16/solver.prototxt \
  --weights ../3_FRCN/output/default/voc_2012_trainval/vgg16_fast_rcnn_iter_60000.caffemodel \
  --imdb voc_2012_trainval \
  --iters 30000 \
  --cfg experiments/cfgs/CasFRCN.yml
