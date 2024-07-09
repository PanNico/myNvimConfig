#!/bin/bash

CUSTOM_APPS_DIR=/opt
CUSTOM_PATH="${CUSTOM_APPS_DIR}/nvim/bin:${CUSTOM_APPS_DIR}/go/bin"
# The names are for debian/ubuntu; https://github.com/neovim/neovim/wiki/Building-Neovim
REQUIREMENTS="build-essential cmake git ninja-build gettext cmake unzip curl fzf"

function tmp_job() {
  local job=$1
  local tmpdir=$(mktemp -d)
  echo "Tmpdr: $tmpdir"
  (
    cd $tmpdir
    $job
  )
  rm -rf $tmpdir
}

function install_go() {
  #go 1.7 is required by lazygit 
  wget https://go.dev/dl/go1.20.linux-amd64.tar.gz
  tar -xvf https://go.dev/dl/go1.7.linux-amd64.tar.gz
  mv go /opt
  echo "export GOROOT=/opt/go" >> ~/.bashrc
  echo "export GOPATH=\${GOPATH}/bin" >> ~/.bashrc
  source ~/.bashrc
}

function install_lazygit() {
  git clone https://github.com/jesseduffield/lazygit.git -b d8059d7f7de21bedd2d989f6961f62ec48781463
  cd lazygit 
  go install
}

function install_neovim() {
	git clone https://github.com/neovim/neovim
	cd neovim
	git checkout 6e68b2e6bc8cb498dd8d047e2eb5086e8ceb1660
	make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/opt/nvim
	sudo make install

	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
		~/.local/share/nvim/site/pack/packer/start/packer.nvim
  cp -r nvim ~/.config
  nvim -c "PackerInstall"

}

sudo apt-get install $REQUIREMENTS
echo "export PATH=$CUSTOM_PATH:$PATH" >> ~/.bashrc
source  ~/.bashrc
tmp_job install_go
tmp_job install_lazygit
tmp_job install_neovim

