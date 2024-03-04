#! /bin/bash

python3 -m venv .rocker_venv

source .rocker_venv/bin/activate

pip install rocker off-your-rocker git+https://github.com/blooop/deps_rocker

code .