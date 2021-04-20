let
  pkgs = import <nixpkgs> {};
  unstable = import (fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) { };
  operator-sdk = pkgs.callPackage .nix/operator-sdk.nix {};
in
pkgs.mkShell {
    buildInputs = with pkgs; [
      go_1_15
      operator-sdk
      unstable.kind
      kubectl
      kustomize
    ];
}
