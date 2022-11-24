
# Stable-Diffusion-webui-mps_venv
This script allows you to install and run Automatic1111's Stable Diffusion WebUI (https://github.com/AUTOMATIC1111/stable-diffusion-webui) with using "venv" on your macOS.
So, you no need to install conda.

# DEMO Pics

"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる


# Features

* Installs and Runs Automatic1111's Stable Diffusion WebUI with using venv on your macOS 
* MPS Support with Pytorch 1.13 Stable
* All samplers will work when you choose --use-cpu all
* In the case of Apple M1 (MacBook Pro '13 2020) with using MPS, will produce 2.86s/it at fastest.
* In the case of Apple M1 (MacBook Pro '13 2020) with using CPU, will produce 5.36s/it at fastest.

"hoge"のセールスポイントや差別化などを説明する
# Tested hardware

* MacBook Pro '13 2020


# System Requirement

"hoge"を動かすのに必要なライブラリなどを列挙する

* macOS 12.0 or later
* Apple Silicon Macs

# Requirement

"hoge"を動かすのに必要なライブラリなどを列挙する

* Xcode command line tools

Other requirements (brew cmake protobuf rust python etc...) will be installed automatically while runnning the script.

# Installation

Requirementで列挙したライブラリなどのインストール方法を説明する

```zsh
# Install Xcode command line tools.
xcode-select --install

# Download this repo.
git clone https://github.com/SpinningSamurai/Stable-Diffusion-webui-mps_venv

# Change directory
cd Stable-Diffusion-webui-mps_venv

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

DEMOの実行方法など、"hoge"の基本的な使い方を説明する

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
If you want to start WebUI with command line arguments, rewrite or add your favorates to line 226 in webui.sh


# Note

I'm not original author of this script. I downloaded the original one from github but its author and the repo seem to have disappeared. 
So I decided to upload my own modified script.
Here are the changes from the original.

* Change Pytorch version from 1.13.0.dev20220922 (Nightly) to 1.13.0 (stable)
* To make iteration 2x faster, I've added "--medvram" instead of "opt-split-attention-v1" in command line arguments.

注意点などがあれば書く



# Author

作成情報を列挙する

* 作成者
* 所属
* E-mail

# License
ライセンスを明示する

"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

社内向けなら社外秘であることを明示してる

"hoge" is Confidential.
