{
  description = "An opinionated environment for developing Python packages";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks-nix = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({self, ...}:{
      flake.flakeModule = import ./flake-module.nix {pydev=self;};
      systems = [];
    });

}
