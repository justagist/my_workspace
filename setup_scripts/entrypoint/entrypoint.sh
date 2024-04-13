#!/bin/bash
set -e

echo -e "
export PATH="/opt/openrobots/bin:$PATH"
export PKG_CONFIG_PATH="/opt/openrobots/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="/opt/openrobots/lib:$LD_LIBRARY_PATH"
export CMAKE_PREFIX_PATH="/opt/openrobots:$CMAKE_PREFIX_PATH"
export PYTHONPATH="${PYTHONPATH}:/opt/openrobots/lib/python3.10/site-packages/"
" >>$HOME/.bashrc

# setup ros environment
echo -e "\nsource /opt/ros/humble/setup.bash && source ${PWD}/my_workspace/install/setup.bash && echo \"sourcing ${PWD}/install/setup.bash\"" >>$HOME/.bashrc
source $HOME/.bashrc

exec "$@"
