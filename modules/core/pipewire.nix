{pkgs, ...}: {
  hardware.asahi.setupAsahiSound = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pulseaudioFull
  ];
}
