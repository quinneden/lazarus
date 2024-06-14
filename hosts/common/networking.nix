{...}: {
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
  networking.firewall.allowedTCPPorts = [3000];
}
