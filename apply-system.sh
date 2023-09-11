#!/bin/sh
set -eu

nixos-rebuild switch --flake .# --use-remote-sudo
