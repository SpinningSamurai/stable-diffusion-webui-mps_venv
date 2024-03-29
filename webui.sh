#!/bin/zsh
set +x;

function help() {
  cat << EOF

A helper utility for ARM based macs to initiate AUTOMATIC1111/stable-diffusion-webui

Install prerequisites: $1 -i
Start server: $1 -s [ADDITIONAL_ARGS]
Clean up directory: $1 -c
Open source directory: $1 -o

----

The following stacks will be installed and used.
- Rust via Rustup
- Python 3 and venv via Pyenv
- Homebrew and the following packages: 'cmake protobuf git wget xz'

You can modify or redistribute the script for public good without any permission.

EOF
}

function info() {
  echo " [[ INFO ]] $1";
}

function warn() {
  echo " [[ WARN ]] $1";
}

function fatal() {
  echo " [[ ERR! ]] $1";
  exit 1;
}

function check_arm() {
  if [[ "$(uname -m)" != "arm64" || "$(uname -s)" != "Darwin" ]]; then;
    fatal "This project is only available on ARM based mac OS.";
  fi;
}

function check_sdk() {
  info "====> Checking the current installation state of Xcode CLT.";
  export SDKROOT=$(xcrun --sdk macosx --show-sdk-path) > /dev/null;

  if [[ "$(xcode-select -p)" != *"CommandLineTools"* ]]; then;
    fatal "You need to install Xcode CLT via `xcode-select --install`. If you're on beta, please visit Apple Developers Download.";
  fi;

  info "SDK step is fully done.";
}

function check_brew() {
  info "====> Checking the current installation state of Homebrew.";
  eval "$(/opt/homebrew/bin/brew shellenv)" > /dev/null;

  if [[ "$(which brew)" == *"not found" ]]; then;
    if [[ -f "/opt/homebrew/bin/brew" ]]; then;
      fatal "Your homebrew installation is broken. Please reinstall the brew manually and retry.";
    fi;

    info "We are installing homebrew on your system.";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
    eval "$(/opt/homebrew/bin/brew shellenv)";

    if [[ "$(which brew)" == *"not found" ]]; then;
      fatal "We failed to install the brew on your system. Please install the brew manually and retry."
    fi;
  fi;

  info "Homebrew is ready and installing dependencies.";
  brew install cmake protobuf git wget xz;

  info "Homebrew step is fully done.";
}

function check_rust() {
  info "====> Checking the current installation state of Rust.";
  . "$HOME/.cargo/env" > /dev/null;

  if [[ "$(which rustc)" == *"not found" ]]; then;
    info "We are installing rust on your system.";
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh;
  fi;

  info "Rust step is fully done.";
}

function check_python() {
  info "====> Checking the current installation state of Python.";
  eval "$(pyenv init -)" > /dev/null;

  if [[ "$(which python)" == *"not found" || "$(python --version)" != *"3.10"* ]]; then;
    if [[ "$(which pyenv)" == *"not found" ]]; then;
      while true; do;
        read -p "Do you want to install pyenv from brew and setup Python 3.10.0 automatically? (y/n) " answer;
        case $answer in
          [Yy]* ) info "We are installing pyenv on your system."; brew install pyenv; break;;
          [Nn]* ) fatal "Canceled! Please, setup the Python 3.10.0 manually and retry.";;
          * ) break;;
        esac
      done;
    fi;

    eval "$(pyenv init -)" > /dev/null;
    alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew' > /dev/null;

    pyenv install 3.10.0;
    pyenv local 3.10.0;
  fi;

  info "Python step is fully done.";
}

function check_repo() {
  info "====> Checking the current state of stable-diffusion-webui repository.";

  if [[ ! -d "./stable-diffusion-webui" ]]; then;
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git stable-diffusion-webui;
  fi;

  cd stable-diffusion-webui;
  # git stash
  git pull --rebase;

  if [[ ! -d "./repositories/stable-diffusion" ]]; then;
    git clone https://github.com/CompVis/stable-diffusion.git repositories/stable-diffusion;
  fi;
  
  if [[ ! -d "./repositories/stable-diffusion-stability-ai" ]]; then;
    git clone https://github.com/Stability-AI/stablediffusion.git repositories/stable-diffusion-stability-ai;
  fi;

  if [[ ! -d "./repositories/taming-transformers" ]]; then;
    git clone https://github.com/CompVis/taming-transformers.git repositories/taming-transformers;
  fi;

  if [[ ! -d "./repositories/CodeFormer" ]]; then;
    git clone https://github.com/sczhou/CodeFormer.git repositories/CodeFormer;
  fi;

  if [[ ! -d "./salesforce/BLIP" ]]; then;
    git clone https://github.com/salesforce/BLIP.git repositories/BLIP;
  fi;

  if [[ ! -d "./repositories/k-diffusion" ]]; then;
    git clone https://github.com/Birch-san/k-diffusion repositories/k-diffusion;
  fi;

  cd ..;
  
  info "Repo step is fully done.";
}

function check_venv() {
  info "====> Checking the current state of venv environment.";

  if [[ ! -f "./bin/activate" ]]; then;
    python3 -m venv .;
  fi;

  . bin/activate;

  info "Venv step is fully done.";
}

function check_pydeps() {
  info "====> Checking the python dependencies.";

  cd stable-diffusion-webui;

  pip install -r requirements.txt;
  pip install git+https://github.com/openai/CLIP.git@d50d76daa670286dd6cacf3bcd80b5e4823fc8e1;
  pip install git+https://github.com/TencentARC/GFPGAN.git@8d2447a2d918f8eba5a4a01463fd48e45126a379;

  pip install fastapi jsonmerge einops clean-fid resize-right torchdiffeq lark gradio omegaconf piexif fonts font-roboto pytorch_lightning transformers kornia realesrgan;
  pip uninstall torch torchvision torchaudio -y;
  pip install torch torchvision torchaudio --no-deps;
  pip install gdown psutil;
  pip install open_clip_torch;


  cd ..;

  info "====> Pydeps step is fully done.";
}

function hook_after() {
  cd ..;
  exit 0;
}

function act_install() {
  info "====> Installing...";

  check_sdk;
  check_brew;
  check_rust;
  check_python;
  check_repo;
  check_venv;
  check_pydeps;

  info "====> Installed. Please, place your models and modules inside the directory.";
  open ./stable-diffusion-webui;

  hook_after;
}

function act_start() {
  info "====> Starting...";

  check_sdk;
  check_python;
  check_venv;
  check_repo;

  info "PYTORCH_ENABLE_MPS_FALLBACK set.";
  export PYTORCH_ENABLE_MPS_FALLBACK=1;
  info "ACCELERATE set.";
  export ACCELERATE="True";
  info "SAFETENSORS_FAST_GPU set.";
  export SAFETENSORS_FAST_GPU=1;
  info "ACCELERATE_USE_MPS_DEVICE set";
  export ACCELERATE_USE_MPS_DEVICE=true;
  
  
  cd stable-diffusion-webui;


  local ADDITIONAL_ARGS=("${(z)@}");

  if [[ "${ADDITIONAL_ARGS}" ]]; then;
    warn "Custom arguments detected: ${ADDITIONAL_ARGS}";

    python webui.py $ADDITIONAL_ARGS;
  else;
    python webui.py --precision full --no-half --no-half-vae --medvram --use-cpu Interrogate GFPGAN CodeFormer;
  fi;

  cd ..;

  hook_after;
}

function act_open() {
  info "====> Opening webui directory...";

  open ./stable-diffusion-webui;

  hook_after;
}

function act_clean() {
  info "====> Cleaning...";

  rm -vrf ./*;

  warn "If you're encountering some error related to LZMA module, you might try to reinstall the Python.";
  warn "We'll prompt you to remove the Python installation used in our project if possible.";
  warn "(IMPORTANT) Please, restart your shell to take effect after uninstalling!"
  eval "$(pyenv init -)" > /dev/null;
  pyenv uninstall 3.10.0;

  hook_after;
}

help "$0";
mkdir -p stable-diffusion-project;

cd stable-diffusion-project;

while getopts "isco" opt; do;
  case $opt in
    i) act_install; break;;
    s) act_start ${@:2}; break;;
    c) act_clean; break;;
    o) act_open; break;;
    *) fatal " ! Unknown option $opt";;
  esac;
done;
