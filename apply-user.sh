#!/bin/sh
set -eu

user=$(whoami)
system=$(nix eval --impure --raw --expr 'builtins.currentSystem')
nix build .#homeManagerConfigurations.$system.$user.activationPackage
./result/activate
