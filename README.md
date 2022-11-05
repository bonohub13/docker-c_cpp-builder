# Docker C/C++ Builder
Simple tool to build your C/C++ project inside docker containers!

## Integration
If you want to integrate a command to clone this repository to your workspace, \
run the command below.
``` bash
    curl https://github.com/bonohub13/docker-c_cpp-builder/blob/main/setup.sh >> ~/.bashrc
```

This will add `c_cpp-builder` command.

## How to use
- Building (using Docker):
    1. Build docker image
        ``` bash
        make rebuild-linux-image
        ```
    2. Build C/C++ project
        ``` bash
        make docker-build
        ```
- Building (using local):
    1. Building C/C++ project
        ``` bash
        make build
        ```

### Notice
- Built binaries using `make docker-build` or `make docker` will be placed \
under `./bin`.
- When building with Docker, it is better to use [rootless-docker](https://docs.docker.com/engine/security/rootless/). \
This way, the built binary belongs to the user, and there won't be any \
priviledge issues.
