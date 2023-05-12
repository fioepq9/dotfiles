# proxy: https://zinglix.xyz/2020/04/18/wsl2-proxy/
[[ $OSTYPE =~ 'linux*' ]] \
&& export PROXY="http://$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'):7890" \
|| echo "zinit/proxy.zsh: unsupported platform"
setproxy() {
        export HTTP_PROXY=$PROXY
        export http_proxy=$PROXY
        export HTTPS_PROXY=$PROXY
        export https_proxy=$PROXY
        export ALL_PROXY=$PROXY
        has git && git config --global http.proxy $PROXY
        has git && git config --global https.proxy $PROXY
}
unsetproxy() {
        unset HTTP_PROXY
        unset http_proxy
        unset HTTPS_PROXY
        unset https_proxy
        unset ALL_PROXY
        has git && git config --global --unset http.proxy
        has git && git config --global --unset https.proxy
}
setproxy