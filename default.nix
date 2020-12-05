{ sources ? import ./nix/sources.nix
, pkgs ? (import sources.nixpkgs {}) }:
pkgs.stdenv.mkDerivation {
  name = "blog";

  src = ./.;

  buildInputs = with pkgs; [
    hugo
  ];

  shellHook = ''
    mkdir -p themes
    ln -snf "${sources.kiera}" themes/kiera
  '';

  buildPhase = ''
    mkdir -p themes
    ln -snf "${sources.kiera}" themes/kiera
    hugo
  '';

  installPhase = ''
    mkdir -p "$out"
    cp -r public/* "$out"
  '';
}
