{ config, pkgs, lib, ... }: {
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "fbreuer@pm.me";
    userName = "Felix Breuer";
    # TODO add signing
    aliases = {
      cm = "commit";
      ca = "commit --amend --no-edit";
      di = "diff";
      dh = "diff HEAD";
      pu = "pull";
      ps = "push";
      pf = "push -f";
      st = "status -sb";
      co = "checkout";
      fe = "fetch";
      gr = "grep -in";
      re = "rebase -i";
    };
    ignores = [
      ".idea" ".vs" ".vsc" ".vscode" # ide
      ".DS_Store" # mac
      "node_modules" "npm-debug.log" # npm
      "__pycache__" "*.pyc" # python
      ".ipynb_checkpoints" # jupyter
      "__sapper__" # svelte
    ];
    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = {
        ff = false;
        commit = false;
        rebase = true;
      };
      url = {
        "ssh://git@github.com" = { insteadOf = "https://github.com"; };
      };
      delta = {
        line-numbers = true;
      };
    };
  };
}
