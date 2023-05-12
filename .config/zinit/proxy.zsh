# proxy: https://zinglix.xyz/2020/04/18/wsl2-proxy/
if linux; then
  export PROXY="socks5://$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'):7890"
elif mac; then
  export PROXY="socks5://127.0.0.1:7890"
else
  echo "zinit/proxy.sh: unsupported platform: $OSTYPE"
fi
setproxy() {
  export HTTP_PROXY=$PROXY
  export http_proxy=$PROXY
  export HTTPS_PROXY=$PROXY
  export https_proxy=$PROXY
  export ALL_PROXY=$PROXY
  if has git; then
    git config --global http.proxy $PROXY
    git config --global https.proxy $PROXY
  fi
}
unsetproxy() {
  unset HTTP_PROXY
  unset http_proxy
  unset HTTPS_PROXY
  unset https_proxy
  unset ALL_PROXY
  if has git; then
    git config --global --unset http.proxy
    git config --global --unset https.proxy
  fi
}
setproxy
