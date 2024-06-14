{pkgs, ...}: {
  programs.fish.enable = true;
  users.users.quinn = {
    isNormalUser = true;
    home = "/home/quinn";
    extraGroups = ["wheel" "audio" "video" "render" "input"];
    shell = pkgs.fish;
  };
}
