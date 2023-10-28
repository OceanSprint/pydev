{
  description = "";

  nixConfig = {
    extra-trusted-public-keys = "";
    extra-substituters = "";
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    pydev = {
      url = "github:oceansprint/pydev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.pydev.flakeModule ];
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      pydev = {
        supportedPythons = [
          "python39"
          "python310"
          "python311"
        ];
        extraTestDependencies = [
          "nmap"
        ];
      };
    };
}
