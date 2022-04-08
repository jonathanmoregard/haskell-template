[![GitHub CI](https://github.com/jonathanmoregard/haskell-template/workflows/CI/badge.svg)](https://github.com/jonathanmoregard/haskell-template/actions)
[![WTFPL](https://img.shields.io/github/license/jonathanmoregard/haskell-template)](LICENSE)

# Haskell Template

Get up & running with production-ready haskell in no time! This "project stump" can be forked, allowing you to get going faster. This project stump expects you to use `nix` and `vscodium/vscode`, and has a ridiculous amount of batteries included:

- [Relude](https://hackage.haskell.org/package/relude) included via a cabal mixin
- A nix development environment accessible though `nix develop`, featuring:
  - formatters for `haskell`, `cabal files`, `nix`, `nixpkgs`, `markdown`, `json`, `yaml` and many more.
  - language servers for haskell & nix
  - hlint
  - cabal
- Scripts for launching `vscode`/`vscodium`in the nix development environment.
  Call `./launch-code.sh`or `./launch-codium.sh` from anywhere and pick up where you left off!
- A list of recommended extensions for formatting, LSP support & file-watch `cabal test`.
- Project-specific settings.json that run `cabal test` every time a haskell file changes. Check `Output > File Watcher` for test results
- Intellisense that just works, in `/src`, `/app`, `/test` & `/benchmark` folders.

## Forking this repo

Launch vscode in the nix development environment by using `./launch-code.sh`or `./launch-codium.sh`, and:

1. Fork this repo and clone it to your local machine. Set the name to your new project name by adding the directory name as the second parameter: `git clone https://github.com/jonathanmoregard/haskell-template.git "${myNewProjectName}"`
2. rename the internal project files by running `./rename-template.sh "${myNewProjectName}"`
3. Open the project using `./launch-code.sh`or `./launch-codium.sh`.
4. The first time you do this, nix will do nix stuff for a long time. The second time it's faster.
5. Install the extensions recommended by the workspace
6. Open a terminal and run `cabal update hackage.haskell.org,2022-03-14T23:55:49Z`
7. Pick any license you want and put it in [LICENSE.md](LICENSE)
8. Replace everything in this readme up until this point with new info. The points below will be needed for users of your new project.

---

## One Time Tooling Set-Up

### 1. Install prerequisites

You need the following software:

- [nix!](https://nixos.org/download.html)
- [vscodium!](https://vscodium.com/#install) (**note**: use `vscode` if you like getting spied on)

### 2. Configure Nix

Configure nix to enable:

- `nix flake` commands (you won't be able to do anything without these)
- Cached binaries for ghc (If you don't do this, you will have to build GHC multiple times!)

Nix settings can be found in `/etc/nix/nix.conf` or, if you are a trusted user, `~/.config/nix/nix.conf`.

Add the following to `nix.conf`:

```
trusted-public-keys = [...] hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= [...]
substituters = [...] https://hydra.iohk.io [...]

experimental-features = nix-command flakes
allow-import-from-derivation = true
```

(The `[...]` denotes previous entries in the list of `trusted-public-keys` & `substituters`)

If you run into issues (= end up building GHC), check out the [troubleshooting guide](https://input-output-hk.github.io/haskell.nix/troubleshooting).

---

## Thanks to

This project is based on output from [Kowainik's "Summoner"](https://github.com/kowainik/summoner).  
This project is built using [IOHK's "Haskell.nix"](https://github.com/input-output-hk/haskell.nix).
