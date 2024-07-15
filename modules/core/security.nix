{...}: {
  security.rtkit.enable = true;
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
  security.pam.services.hyprlock = {};
}
