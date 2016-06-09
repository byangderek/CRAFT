#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

LOG="frcn_train_12trainval_vgg16.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time  ./tools/train_net.py --gpu 0 \
  --solver models/VGG16/solver.prototxt \
  --weights data/imagenet_models/VGG16.v2.caffemodel \
  --imdb voc_2012_trainval \
  --iters 60000
