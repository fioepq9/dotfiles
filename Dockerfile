FROM fedora:40

# fix for following error
# fish: error while loading shared libraries: libatomic.so.1: cannot open shared object file: No such file or directory
RUN dnf install -y gcc libatomic

RUN curl -fsLS https://pkgx.sh | sh
RUN pkgx install cargo
RUN cargo --version
RUN pkgx install zsh && zsh -v
RUN pkgx install rsync
RUN pkgx install chezmoi.io

COPY . /tmp/dotfiles
WORKDIR /tmp/dotfiles
RUN chmod a+x install.sh && bash install.sh



WORKDIR /root

ENTRYPOINT ["zsh", "-c"]

CMD ["zsh"]

