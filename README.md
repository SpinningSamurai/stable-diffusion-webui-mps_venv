
# Stable-Diffusion-webui-mps_venv
This script allows you to install and run [Automatic1111's Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) with using [venv](https://docs.python.org/3/library/venv.html) on your macOS.
So, you no need to install [conda](https://docs.conda.io/en/latest/miniconda.html).

# DEMO Pics

"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる


# Features

* Installs and Runs Automatic1111's Stable Diffusion WebUI with using venv on your macOS 
* MPS Support with Pytorch 1.13 Stable
* All samplers will work when you add --use-cpu all in command line arguments
* In the case of Apple M1 (MacBook Pro '13 2020) with using MPS, will produce 2.86s/it at fastest.
* In the case of Apple M1 (MacBook Pro '13 2020) with using CPU, will produce 5.36s/it at fastest.


# Tested hardware

* MacBook Pro '13 2020


# System Requirement


* macOS 12.0 or later
* Apple Silicon Macs

# Requirement


* Xcode command line tools

Other requirements (homebrew cmake protobuf rust python etc...) will be installed automatically while runnning the script.

# Installation


```zsh
# Install Xcode command line tools.
xcode-select --install

# Download this repo.
git clone https://github.com/SpinningSamurai/stable-diffusion-webui-mps_venv

# Change directory
cd stable-diffusion-webui-mps_venv

# Install requirements
./webui.sh -i
```

If you face some permissions error about webui.sh, try below.
```zsh
# Give the file execute permissions
chmod +x ./webui.sh

# Try again
./webui.sh -i
```
After that, put your favorite model (.ckpt file) in right directly.

# Usage


```zsh
# Start WebUI
./webui.sh -s

# Install requirements
./webui.sh -i

# Clean up directory
./webui.sh -c

# Open source directory
./webui.sh -o
```
If you want to start WebUI with command line arguments, rewrite or add your favorites to line 226 in webui.sh


# Note
> **Note**  
> **I'm not original author of this script.** 

I downloaded the original one from github but its author and the repo seem to have disappeared. 
So I decided to upload my own modified one.
Here are the major changes from the original one.

* Change Pytorch version from 1.13.0.dev20220922 (Nightly) to 1.13.0 (stable)
* To make iteration 2x faster, I've added "--medvram" instead of "opt-split-attention-v1" in command line arguments.
* Some optimizations and bugfixes.



Feel free to ask me when you have a issue or pull request:9



# Author


作成情報を列挙する

* [SpinningSamurai](https://github.com/SpinningSamurai)
* A Original author of this script (I completely forgot your name sorry.)


# License


This repository is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

