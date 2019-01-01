let
  pkgs = import <nixpkgs> {};

in

pkgs.stdenv.mkDerivation {
  name = "dawehner.github.io";
  buildInputs = [
    pkgs.jekyll
  ];
}
