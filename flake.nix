{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    mnw.url = "github:Gerg-L/mnw";

    #
    # non-nixpkgs plugins
    #
    tree-sitter-manager-nvim = {
      url = "github:romus204/tree-sitter-manager.nvim";
      flake = false;
    };
    direnv-nvim = {
      url = "github:NotAShelf/direnv.nvim";
      flake = false;
    };
    buffer-sticks-nvim = {
      url = "github:ahkohd/buffer-sticks.nvim";
      flake = false;
    };
  };

  outputs =
    { flake-parts, nixpkgs, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./package.nix ];
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      flake.overlays.default = final: prev: {
        neovim-nvx = inputs.self.packages.${prev.stdenv.hostPlatform.system}.nvx;
      };

      perSystem =
        {
          pkgs,
          self',
          system,
          ...
        }:
        {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          formatter = pkgs.nixfmt-tree.override { nixfmtPackage = pkgs.nixfmt-rs; };
          devShells.default = pkgs.mkShell {
            packages =
              self'.formatter.passthru.runtimeInputs
              ++ (with pkgs; [
                fennel-ls
                fnlfmt
              ]);
          };
        };
    };
}
