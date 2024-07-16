{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # nix language
      bbenoist.nix
      # nix-shell suport
      arrterian.nix-env-selector
      # python
      # ms-python.python
      # Color theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
    userSettings = {
      "update.mode" = "none";
      "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
      "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509

      "window.menuBarVisibility" = "hidden";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
      "editor.fontSize" = 16;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "catppuccin.accentColor" = "lavender";
      "vsicons.dontShowNewVersionMessage" = true;
      "explorer.confirmDragAndDrop" = false;
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.startupEditor" = "none";

      "editor.formatOnSave" = true;
      "editor.formatOnType" = false;
      "editor.formatOnPaste" = true;

      "workbench.layoutControl.type" = "menu";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 10;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.showTabs" = "single";
      "files.autoSave" = "onWindowChange";
      "explorer.openEditors.visible" = 0;
      "breadcrumbs.enabled" = true;
      "editor.renderControlCharacters" = false;
      "workbench.activityBar.location" = "bottom";
      "workbench.statusBar.visible" = true;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "workbench.layoutControl.enabled" = false;

      "editor.mouseWheelZoom" = false;
    };
    # Keybindings
    keybindings = [
      {
        key = "ctrl+/";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
      {
        key = "meta+s";
        command = "workbench.action.files.saveFiles";
      }
      {
        key = "meta+shift+w";
        command = "workbench.action.terminal.new";
        when = "terminalProcessSupported || terminalWebExtensionContributedProfile";
      }
      {
        key = "ctrl+w";
        command = "";
      }
      {
        key = "ctrl+d";
        command = "editor.action.duplicateSelection";
      }
      {
        key = "meta+shift+e";
        command = "workbench.view.explorer";
        when = "viewContainer.workbench.view.explorer.enabled";
      }
      {
        command = "editor.action.duplicateSelection";
        key = "ctrl+d";
      }
    ];
  };
}
