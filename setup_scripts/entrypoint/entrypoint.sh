#!/bin/bash
set -e

# setup ros environment
echo -e "\nsource /opt/ros/humble/setup.bash && source ${PWD}/my_workspace/install/setup.bash && echo \"sourcing ${PWD}/install/setup.bash\"" >>$HOME/.bashrc
echo -e "export MY_WORKSPACE_PATH=\"${HOME}/my_workspace\"; export COLCON_LOG_PATH=\"${HOME}/my_workspace/log\"; export PATH=\"${HOME}/my_workspace/bin:$PATH\"" >>$HOME/.bashrc

source $HOME/.bashrc

exec "$@"
