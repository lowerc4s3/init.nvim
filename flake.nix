{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    blueprint = {
      url = "github:numtide/blueprint";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.blueprint {
      inherit inputs;

      prefix = "nix/";
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      nixpkgs.config.allowUnfree = true;
    };
}
