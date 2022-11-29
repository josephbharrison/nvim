FROM ubuntu:focal

# Requires follwowing switches to work
# --device /dev/fuse --cap-add SYS_ADMIN
#
# Mount workspace to /workspace/
#
# docker run --rm --device /dev/fuse --cap-add SYS_ADMIN -v /path/to/my/workspace:/workspace:rw -it nvim

RUN mkdir /nvim
COPY . /nvim/
RUN bash /nvim/install.sh
RUN rm -rf /nvim/
RUN mkdir -p /workspace
WORKDIR /workspace/

# Enter in bash, user will need to run nvim for initial install and restart it
#
# nvim -c 'autocmd User PackerComplete quitall'
ENTRYPOINT [ "bash" ]