#!/bin/bash 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd "${SCRIPT_DIR}" || exit
find . -type f -name "*.nix" -print0 | xargs -0 sed -i "s/haskell-template/${1}/g"
find . -type f -name "*.cabal" -print0 | xargs -0 sed -i "s/haskell-template/${1}/g"
mv haskell-template.cabal "${1}.cabal"
popd || exit