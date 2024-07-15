{
  self,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = [];
      trusted-public-keys = [];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  nixpkgs = {
    overlays = [
      self.overlays.default
      inputs.nur.overlay
      nixos-apple-silicon.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    asahi-bless
    asahi-btsync
    btrfs-progs
    git
    micro
    wget
  ];

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
