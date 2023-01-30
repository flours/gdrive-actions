FROM ubuntu

WORKDIR /work
VOLUME ["/work"]
CMD ["bash","-c","echo \"hello $arg\""]
