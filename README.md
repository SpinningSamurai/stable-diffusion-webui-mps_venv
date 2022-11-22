
# -Stable-Diffusion-webui-mps_venv-version
This script allows you to install and run Automatic1111's Stable Diffusion WebUI (https://github.com/AUTOMATIC1111/stable-diffusion-webui) with using "venv" on your macOS.
So, you no need to install conda.

# DEMO Pics

"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる

# Features

* Installs and Runs Automatic1111's Stable Diffusion WebUI with using venv on your macOS 
* MPS Support with Pytorch 1.13 Stable
* All samplers works when you choose --use-cpu all

"hoge"のセールスポイントや差別化などを説明する

Currently if you want to run Automatic1111's Stable Diffusion WebUI (https://github.com/AUTOMATIC1111/stable-diffusion-webui) on your macOS, you need to install miniconda or Anaconda for creating virtual environment, but without anaconda (or conda), python3.10 is already able to create that with "venv" command.

This script allows you to install and run Automatic1111's Stable Diffusion WebUI (https://github.com/AUTOMATIC1111/stable-diffusion-webui) using "venv" on your macOS.
So, you no need to install conda.

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
git clone https://github.com/SpinningSamurai/-Stable-Diffusion-webui-mps_venv-version

# Change directory
cd Stable-Diffusion-webui-mps_venv-version

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
git clone https://github.com/hoge/~
cd examples
python demo.py
```

# Note

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
