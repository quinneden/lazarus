{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./cli/git.nix
    ./cli/fish.nix
    ./cli/micro.nix
    ./desktop/gtk.nix
    ./desktop/sway.nix
    ./desktop/furryfox.nix
    ./desktop/waybar.nix
  ];
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    ripgrep
    wezterm
    vagrant
    qemu
    lima
    micro
    eza
    fzf
    fd
    nodejs
    bun
    cargo
    rustc
    gcc
  ];
  xdg.configFile."wezterm" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/quinn/.dotfiles/configs/wezterm";
    recursive = true;
  };
}
