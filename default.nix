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
    ln -snf "${sources.jane}" themes/jane
  '';

  buildPhase = ''
    mkdir -p themes
    ln -snf "${sources.jane}" themes/jane
    hugo
  '';

  installPhase = ''
    mkdir -p "$out"
    cp -r public/* "$out"
  '';
}
