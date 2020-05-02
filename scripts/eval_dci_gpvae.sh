#!/bin/bash

# Evaluate DCI metric for gpvae models

for dim in 64; do
  for base_dir in models/dim/dsprites_dim_"$dim"_1/*; do
    bsub -g /gpvae_norm -R "rusage[mem=16000]" python dsprites_dci.py --z_name factors_dsprites_100k_5k.npy \
    --model_name $base_dir
  done
done
