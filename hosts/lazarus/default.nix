{inputs, ...}: {
  imports = [
    ../common
    ./hardware.nix
    inputs.nixos-apple-silicon.nixosModules.apple-silicon-support
  ];

  nixpkgs.overlays = [
    inputs.nixos-apple-silicon.overlays.apple-silicon-overlay
    (final: prev: {mesa = final.mesa-asahi-edge;})
  ];

  hardware = {
    asahi = {
      peripheralFirmwareDirectory = ./firmware;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "driver";
      withRust = true;
    };
    opengl.enable = true;
  };

  boot = {
    consoleLogLevel = 0;
    kernelParams = [];
    loader.efi.canTouchEfiVariables = false;
  };

  networking.hostName = "lazarus";
  system.stateVersion = "24.11";
}
