{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixos-apple-silicon,
    self,
    ...
  } @ inputs: let
    selfPkgs = import ./pkgs;
    username = "quinn";
    system = "aarch64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    overlays.default = selfPkgs.overlay;
    nixosConfigurations = {
      macmini = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/macmini)];
        specialArgs = {
          host = "macmini";
          inherit self inputs username;
        };
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/vm)];
        specialArgs = {
          host = "vm";
          inherit self inputs username;
        };
      };
    };
  };
}
