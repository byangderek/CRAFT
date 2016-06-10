#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

LOG="casfrcn_test_12trainval_12test_vgg16.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"
  
time ./tools/test_net.py --gpu 0 \
  --def models/VGG16/test.prototxt \
  --net output/CasFRCN/voc_2012_trainval/vgg16_casfrcn_iter_30000.caffemodel \
  --imdb voc_2012_test \
  --cfg experiments/cfgs/CasFRCN.yml