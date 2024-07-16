{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nixos-apple-silicon.nixosModules.default];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
      ];
    };

    asahi = {
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "replace";
      withRust = true;
    };
  };
  hardware.enableRedistributableFirmware = true;
}
