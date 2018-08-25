FROM ubuntu:16.04
LABEL maintainer="Kyle Bai <k2r2.bai@gmail.com>"

ENV LANG en_US.UTF-8
WORKDIR /root

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -yu ppa:jonathonf/vim && \
  apt-get install -y vim wget curl zsh git && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl && \
  wget -qO- https://github.com/ksonnet/ksonnet/releases/download/v0.12.0/ks_0.12.0_linux_amd64.tar.gz | tar -zx && \
  chmod +x ./ks_0.12.0_linux_amd64/ks && mv ./ks_0.12.0_linux_amd64/ks /usr/local/bin/ks && \
  rm -rf ./ks_0.12.0_linux_amd64 && \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
  chsh -s /bin/zsh

COPY .zshrc /root/
COPY .vimrc /root/

RUN vim +PluginInstall +qall && \
  sed -i "s/\"colorscheme/colorscheme/g" ~/.vimrc && \
  apt-get purge -y software-properties-common && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/zsh"]
