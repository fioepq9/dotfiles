FROM fedora:40

# fix for following error
# fish: error while loading shared libraries: libatomic.so.1: cannot open shared object file: No such file or directory
RUN dnf install -y gcc libatomic

COPY . /tmp/dotfiles
WORKDIR /tmp/dotfiles
RUN chmod a+x install.sh && ./install.sh

RUN fish -v
RUN starship -V
RUN cargo -V
RUN git --version
RUN nvim --version
RUN curl --version
RUN bat --version
RUN jq --version
RUN yq --version
RUN eza --version
RUN rg --version
RUN fd --version
RUN fzf --version
RUN chezmoi --version


WORKDIR /root

ENTRYPOINT ["fish", "-c"]

CMD ["fish"]

