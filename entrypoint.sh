#!/bin/bash
set -eux
# Taken from https://github.com/zhxiaogg/cargo-static-build

printenv

# hack, move home to $HOME(/github/home)
ln -s /root/.cargo $HOME/.cargo
ln -s /root/.rustup $HOME/.rustup

# go to the repo root
cd $GITHUB_WORKSPACE
eval "$*"
chmod 0777 ./target
