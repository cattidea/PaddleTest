@echo off
cd ../..

md log\text_classification_pretrained
set logpath=%cd%\log\text_classification_pretrained

cd models_repo\examples\text_classification\pretrained_models\

python -m paddle.distributed.launch --gpus "0" train.py --batch_size 8 --epochs 1 --save_dir ./checkpoints  --use_amp False --device %1 > %logpath%/train_%1.log 2>&1
