{ config, pkgs, lib, ... }: {
  imports = [
    ./karabiner.nix
    ./yabai.nix
    ./spacebar.nix
    ./alacritty.nix
    ./zsh.nix
    ./tmux.nix
    ./git.nix
    ./vim
  ];

  home = {
    stateVersion = "21.11";

    packages = with pkgs; [
      # terminal
      bottom
      fd ripgrep
      gitAndTools.delta
      wget curl
      thefuck
      sshfs

      kubectl
      k9s

      starship

      # TODO m1 mac
      #buildah
    ];

    sessionPath = [ "~/go/bin" ];
    sessionVariables = {
      GOROOT = "${pkgs.go.out}/share/go";
      GO111MODULE = "on";
      GOPRIVATE = "github.com/stackitcloud";
    };
  };

  programs = {
    # let home-manager manage itself
    home-manager.enable = true;

    # shell integrations are enabled by default
    autojump.enable = true;
    jq.enable = true;

    lsd = {
      enable = true;
      enableAliases = true;
    };

    bat = {
      enable = true;
      # TODO check if theme gets picked up
      #config = { theme = "base16"; };
    };

    go = {
      enable = true;
      goPath = "go";
      goBin = "go/bin";
    };

    htop = {
      enable = true;
      settings = {
        tree_view = true;
        show_cpu_frequency = true;
        show_cpu_usage = true;
        show_program_path = false;
      };
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache";
      defaultOptions = [
        "--border sharp"
        "--inline-info"
      ];
    };
  };
}
