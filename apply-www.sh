#!/bin/sh
set -eu

NIX_SSHOPTS=-t nixos-rebuild switch --flake .#www --target-host pnm@pnm.tf --use-remote-sudo
