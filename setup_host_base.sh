#! /bin/bash

python3 -m venv .rocker_venv

source .rocker_venv/bin/activate

pip install deps-rocker

code .