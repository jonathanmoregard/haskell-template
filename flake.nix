{
  description = "Basic flake for building haskell-template";
  inputs.haskellNix.url = "github:input-output-hk/haskell.nix";
  inputs.nixpkgs.follows = "haskellNix/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils, haskellNix }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" ] (system:
      let
        overlays = [
          haskellNix.overlay
          (final: prev: {
            # This overlay adds our project to pkgs
            "haskell-template" =
              final.haskell-nix.cabalProject' {
                src = ./.;
                compiler-nix-name = "ghc8107";
                name = "haskell-template";
                index-state = "2022-03-14T23:55:49Z";
                # This is used by `nix develop .` to open a shell with dev tooling available
                shell.tools = {
                  cabal = "latest";
                  hlint = "latest";
                  haskell-language-server = "latest";
                  ormolu = "0.3.1.0"; # latest is broken!
                  cabal-fmt = "latest";
                };
                # Non-Haskell shell tools go here
                shell.buildInputs = with pkgs; [
                  nixpkgs-fmt
                  rnix-lsp
                  nixfmt
                  nodePackages.prettier
                ];
              };
          })
        ];
        pkgs = import nixpkgs { inherit system overlays; inherit (haskellNix) config; };
        flake = pkgs."haskell-template".flake { };
      in
      flake // {
        # Built by `nix build .`
        defaultPackage = flake.packages."haskell-template:exe:haskell-template";
      });
}
