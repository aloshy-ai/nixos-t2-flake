{
  nixConfig = {
    extra-substituters = [
      # "https://hydra.soopy.moe"
      "https://cache.soopy.moe" # toggle these if this one doesn't work.
    ];
    extra-trusted-public-keys =
      [ "hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q=" ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { nixpkgs, nixos-hardware, ... }: {
    # remove everything below this
    templates.default = {
      path = builtins.filterSource (path: _:
        (!builtins.elem (builtins.baseNameOf path) [ "README.md" "configuration.nix" "LICENSE" ])) ./.;
      description =
        "A flake to quickly get started to use NixOS on a T2 Mac device.";
    };
    # remove everything above this

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-classic;

    nixosConfigurations.yourHostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        ./nix/substituter.nix
        nixos-hardware.nixosModules.apple-t2
      ];
    };
  };
}
