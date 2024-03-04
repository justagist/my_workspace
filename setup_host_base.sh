#! /bin/bash

pip3 install rocker off-your-rocker git+https://github.com/blooop/deps_rocker

python -m venv .rocker_venv

source .rocker_venv/bin/activate

code .