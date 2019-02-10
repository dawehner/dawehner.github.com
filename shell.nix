{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "dawehner.github.io";

  buildInputs = [ pkgs.jekyll ];
}