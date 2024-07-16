{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bleachbit # cache cleaner
    cinnamon.nemo-with-extensions # file manager
    cliphist # clipboard manager
    cmatrix
    entr # perform action when file change
    evince # gnome pdf viewer
    eza # ls replacement
    fd # find replacement
    ffmpeg
    file # Show file information
    fzf # fuzzy finder
    gcc
    gnumake
    gparted # partition manager
    imv # image viewer
    inputs.alejandra.defaultPackage.${system}
    killall
    lazygit
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
    nitch # systhem fetch util
    nix-prefetch-github
    openssl
    pamixer # pulseaudio command line mixer
    pavucontrol # pulseaudio volume controle (GUI)
    playerctl # controller for media players
    poweralertd
    pure-prompt
    python3
    qalculate-gtk # calculator
    ripgrep # grep replacement
    tdf # cli pdf viewer
    todo # cli todo list
    unzip
    wget
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    xdg-utils
    xxd
    yazi # terminal file manager
    zenity
  ];
}
