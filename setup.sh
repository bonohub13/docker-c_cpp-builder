
c_cpp-builder() {
    git clone https://github.com/bonohub13/docker-c_cpp-builder /tmp/docker-c_cpp-builder \
        && rm -rf /tmp/docker-c_cpp-builder/.git \
            /tmp/docker-c_cpp-builder/LICENSE \
            /tmp/docker-c_cpp-builder/setup.sh \
        && cp -r /tmp/docker-c_cpp-builder/* ./ \
        && rm -rf /tmp/docker-c_cpp-builder

    return $?
}
