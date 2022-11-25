
# stable-diffusion-webui-mps_venv
This script allows you to install and run [Automatic1111's Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) with using [venv](https://docs.python.org/3/library/venv.html) on your macOS.
So, you no need to install [conda](https://docs.conda.io/en/latest/miniconda.html).

# Pics

<img width="1911" alt="Screenshot" src="https://user-images.githubusercontent.com/97383975/203933972-bc4c988d-90bd-4703-a132-426a271a0266.png">



# Features

* Installs and Runs Automatic1111's Stable Diffusion WebUI with using venv on your macOS 
* MPS Support with Pytorch 1.13 stable
* All samplers will work.



# Tested hardware

* MacBook Pro '13 2020

# How's the speed?
* In the case of Apple M1 (MacBook Pro '13 2020) with using MPS, will produce 2.86s/it at fastest.
* In the case of Apple M1 (MacBook Pro '13 2020) with using CPU, will produce 5.36s/it at fastest.


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
So I decided to upload my own modified one because he/she allowed redistribution in the script.

Here are the major changes from the original one.

* Change Pytorch version from 1.13.0.dev20220922 (Nightly) to 1.13.0 (stable)
* To reduce RAM usage, I've added "--medvram" instead of "opt-split-attention-v1" in command line arguments. 
* Some optimizations and bugfixes.


In the end, it led iteration about 2x faster from original one.



Feel free to ask me when you have a issue or pull request. :9

# Known issues
* It may require to install "torchsde". Please manually add "torchsde" to the requirements.txt in created directly. then reinstall requirements and rerun WebUI

# Author and Credits



* [SpinningSamurai](https://github.com/SpinningSamurai)
* A Original author of this script (I completely forgot your name sorry.)


# License


This repository is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

