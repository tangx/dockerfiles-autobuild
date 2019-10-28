FROM arm64v8/golang:1.13.3 as builder

ENV GITLAB_RUNNER_VERSION=v12.4.0
ENV DUMB_INIT_VERSION=v1.2.2

# WORKDIR $GOPATH
RUN apt update \
    && apt install -y git  \
    && mkdir -p $GOPATH/src/gitlab.com/gitlab-org/  \
    && cd $GOPATH/src/gitlab.com/gitlab-org/    \
    && git clone https://gitlab.com/gitlab-org/gitlab-runner.git    \
    && cd $GOPATH/src/gitlab.com/gitlab-org/gitlab-runner \
    && git checkout $GITLAB_RUNNER_VERSION  \
    && unset GO111MODULE    \
    && go build -o /tmp/gitlab-runner . \
    && /tmp/gitlab-runner --version \
    && cp -a dockerfiles/ubuntu/entrypoint /tmp/entrypoint

RUN apt install -y gcc make \
    && cd $GOPATH   \
    && git clone https://github.com/Yelp/dumb-init.git  \
    && cd dumb-init \
    && git checkout ${DUMB_INIT_VERSION}    \
    && make \
    && cp dumb-init  /tmp/dumb-init \
    && /tmp/dumb-init --version

### gitlab-runner dockerfile
# https://gitlab.com/gitlab-org/gitlab-runner/blob/master/dockerfiles/ubuntu/Dockerfile

# FROM arm64v8/ubuntu:18.04
FROM arm64v8/debian:9-slim

ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update -y \
#     && apt-get install -y ca-certificates wget apt-transport-https vim nano tzdata git curl \
#     && rm -rf /var/lib/apt/lists/*

ENV GITLAB_RUNNER_VERSION=v12.4.0
ENV DOCKER_MACHINE_VERSION=0.16.2
ENV GIT_LFS_VERSION=2.9.0
ENV DUMB_INIT_VERSION=1.2.2


COPY --from=builder /tmp/gitlab-runner /usr/bin/gitlab-runner
COPY --from=builder /tmp/entrypoint /entrypoint

COPY --from=builder /tmp/dumb-init /usr/bin/dumb-init


RUN apt-get update \
    && apt-get -f install -y ca-certificates apt-transport-https \
                             wget curl \
                             tzdata \
                             git \
    && gitlab-runner --version \
    && mkdir -p /etc/gitlab-runner/certs \
    && chmod -R 700 /etc/gitlab-runner \

    && wget -nv https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION}/docker-machine-Linux-aarch64 -O /usr/bin/docker-machine \
    && chmod +x /usr/bin/docker-machine \
    && docker-machine --version \

    # && wget -nv https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 -O /usr/bin/dumb-init \
    && chmod +x /usr/bin/dumb-init  \
    && dumb-init --version \

    && wget -nv https://github.com/git-lfs/git-lfs/releases/download/v${GIT_LFS_VERSION}/git-lfs-linux-arm64-v${GIT_LFS_VERSION}.tar.gz -O /tmp/git-lfs.tar.gz \
    && mkdir /tmp/git-lfs \
    && tar -xzf /tmp/git-lfs.tar.gz -C /tmp/git-lfs/ \
    && mv /tmp/git-lfs/git-lfs /usr/bin/git-lfs \
    && rm -rf /tmp/git-lfs* \
    && git-lfs install --skip-repo \
    && git-lfs version \

    && chmod +x /entrypoint \

    && apt autoremove -y wget curl    \
    && rm -rf /var/lib/apt/lists/* 


STOPSIGNAL SIGQUIT
VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]

