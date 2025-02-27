{ pkgs ? import <nixpkgs> { } }:
let
   pname = "typy-cli";
   git-tag = "v0.8.0";


   src = pkgs.fetchFromGitHub {
     owner = "Pazl27";
     repo = "${pname}";
     rev = "${git-tag}";
     sha256 = "sha256-2PquHZmgblRxo2Zzxzn00Jeu4FR7tTPptyCFx1yVCt8=";
   };

   manifest = (pkgs.lib.importTOML "${src}/Cargo.toml").package;
in
pkgs.rustPlatform.buildRustPackage {
  pname = manifest.name;
  version = manifest.version;
  cargoLock.lockFile = "${src}/Cargo.lock";
  src = pkgs.lib.cleanSource src;
}
