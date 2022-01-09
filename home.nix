{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "siktro";
  home.homeDirectory = "/home/siktro";

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  home.packages = with pkgs; [
    firefox

    starship
    tmux

    neovim
    ranger

    fzf
    bat
    ripgrep
    fd
    exa
    htop
  ];

  programs.git = {
    enable = true;
    userName = "siktro";
    userEmail = "siktro@gmail.com";
    extraConfig = {
      core = { editor = "nvim"; };
      color = { ui = true ; };
      init = { defaultBranch = "main"; }; # fine...
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    starship init fish | source
    '';
    shellAliases = {
      cat = "bat";
      ll = "exa -all --long --header --group --icons --group-directories-first --sort=name";
    };
    functions = {
      take = "mkdir $argv && cd $argv";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "mononoki Nerd Font";
        bold.family = "mononoki Nerd Font";
        italic.family = "mononoki Nerd Font";
        bold_italic.family = "mononoki Nerd Font";
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
