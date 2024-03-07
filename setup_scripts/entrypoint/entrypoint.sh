#!/bin/bash
set -e

# setup ros environment
echo -e "\nsource /opt/ros/humble/setup.bash && source ${PWD}/my_workspace/install/setup.bash && echo \"sourcing ${PWD}/install/setup.bash\"" >>$HOME/.bashrc
source $HOME/.bashrc

exec "$@"
