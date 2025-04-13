# Dockerfile to test dotfiles in isolation (Ghostty not included – macOS-only)
# Additional tools used to test dotfiles integration:
# - kubectl: for dynamic completion tests
# - pyenv: to validate zprofile behavior
# - fzf: required by the shell configuration

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Base packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    zsh vim tmux git curl locales make python3-pip ripgrep unzip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Locale
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# User
ARG USERNAME=testuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $USERNAME && \
    useradd -m -u $UID -g $GID -s /bin/zsh $USERNAME && \
    chsh -s /bin/zsh $USERNAME

# kubectl (for testing completions)
RUN curl -sSL "https://storage.googleapis.com/kubernetes-release/release/$(curl -sSL https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

USER $USERNAME
WORKDIR /home/$USERNAME

# pyenv (zprofile test)
RUN curl https://pyenv.run | bash

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install --all
ENV PATH="${PATH}:/home/${USERNAME}/.fzf/bin"

# dotfiles
COPY . /home/${USERNAME}/.dot
RUN echo docker > ~/.dot_profile

WORKDIR /home/${USERNAME}/.dot
RUN make clean && make all INSTALL_GHOSTTY=0
