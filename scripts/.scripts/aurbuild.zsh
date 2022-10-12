#!/bin/zsh
AUR="${AUR:-$HOME/.sources/build/aur}"
REPO="${REPO:-$HOME/.sources/packages}"
pushd "$AUR" || exit
for dir in */; do
    pushd "$dir" || exit
    makepkg --sign --syncdeps || true
    popd || exit
done
popd || exit
repo-add --new --verify --sign $REPO/benji.db.tar.zst $REPO/*.pkg.tar.zst
