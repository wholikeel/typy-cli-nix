# typy-cli nix flake

Nix flake for [typy-cli](https://github.com/Pazl27/typy-cli) by [Pazl27](https://github.com/Pazl27).


## Usage

Provides two outputs (accessible via `nix build`) `default` and `setup`. `default` of course being implicit when ommiting the specific output, and setup being requried to download the `english.txt` and put it into the `.local/share/typy` directory.


