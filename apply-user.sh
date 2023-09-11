#!/bin/sh
set -eu

user=$(whoami)
nix build .#homeManagerConfigurations.$user.activationPackage
./result/activate
