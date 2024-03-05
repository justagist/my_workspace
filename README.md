# Workspace

1. Clone any repo in this workspace.
2. Run `source ./setup_host_base.sh`. creates venv, installs rocker stuff, launches vscode in venv.
3. Run vscode task `Build image`. All dependencies in files `deps.yaml` in this folder and all nested
   directories will be installed in a docker image as explained in [deps_rocker](https://github.com/blooop/deps_rocker)
   package readme.
4. Once built, use vscode task `launch container` to spin a container and attach a vscode instance to this container.
5. When dependencies change in the project, update existing `deps.yaml` or create a new one, and run step 3 again.

Uses [rocker](https://github.com/osrf/rocker) and extensions such as [deps_rocker](https://github.com/blooop/deps_rocker).
