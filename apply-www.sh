#!/bin/sh
set -eu

NIX_SSHOPTS=-t nixos-rebuild switch --flake .#www --target-host pnm@92.243.26.156 --use-remote-sudo
