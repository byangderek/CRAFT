#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

LOG="casrpn_test_12trainval_12test_vgg16.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time  ./tools/test_net.py --gpu 0 \
  --def models/VGG16/test.prototxt \
  --net output/CasRPN/voc_2012_trainval/vgg16_casRPN_iter_60000.caffemodel \
  --imdb voc_2012_trainval \
  --cfg experiments/cfgs/CasRPN.yml
  
time ./tools/test_net.py --gpu 0 \
  --def models/VGG16/test.prototxt \
  --net output/CasRPN/voc_2012_trainval/vgg16_casRPN_iter_60000.caffemodel \
  --imdb voc_2012_test \
  --cfg experiments/cfgs/CasRPN.yml