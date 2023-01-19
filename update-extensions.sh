#!/bin/sh


dir_path="/Users/enter_your_username_here/stable-diffusion-webui-mps_venv/stable-diffusion-project/stable-diffusion-webui/extensions/*"

for dir in $dir_path;
do
  (
    echo $dir
    cd $dir
    git pull
  )
done
