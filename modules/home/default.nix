{
  inputs,
  username,
  host,
  dotdir,
  ...
}: {
  imports =
    [(import ./bat.nix)] # better cat command
    ++ [(import ./btop.nix)] # resouces monitor
    ++ [(import ./floorp/floorp.nix)] # firefox based browser
    ++ [(import ./fuzzel.nix)] # launcher
    ++ [(import ./git.nix)] # version control
    ++ [(import ./gtk.nix)] # gtk theme
    ++ [(import ./hyprland)] # window manager
    ++ [(import ./kitty.nix)] # terminal
    ++ [(import ./swaync/swaync.nix)] # notification deamon
    ++ [(import ./micro.nix)] # nano replacement
    ++ [(import ./nvim.nix)] # neovim editor
    ++ [(import ./packages.nix)] # other packages
    ++ [(import ./scripts/scripts.nix)] # personal scripts
    ++ [(import ./starship.nix)] # shell prompt
    ++ [(import ./swaylock.nix)] # lock screen
    ++ [(import ./vscodium.nix)] # vscode forck
    ++ [(import ./waybar)] # status bar
    ++ [(import ./zsh.nix)]; # shell
}
