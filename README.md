# Workspace

1. Clone any repo in this workspace.
2. Run `source ./setup_host_base.sh`. creates venv, installs rocker stuff, launches vscode in venv.
3. Run vscode task `launch_container`. All dependencies in files `deps.yaml` in this folder and all nested
   directories will be installed as explained in [deps_rocker](https://github.com/blooop/deps_rocker) package readme.

Uses [rocker](https://github.com/osrf/rocker) and extensions such as [deps_rocker](https://github.com/blooop/deps_rocker).
