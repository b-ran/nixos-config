{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dwt1-shell-color-scripts
    krabby
    thefuck
    woof
  ];

  programs.zsh = {
    enableAutosuggestions = true;
    enableCompletion = true;

    localVariables = {
      ENHANCD_ENABLE_HOME = false;
      ENHANCD_ENABLE_DOUBLE_DOT = false;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "ssh-agent"
        "safe-paste"
        "extract"
        "copyfile"
        "copybuffer"
        "copypath"
        "thefuck"
      ];
      extraConfig = ''
        zstyle :omz:plugins:ssh-agent quiet yes
        zstyle :omz:plugins:ssh-agent lazy yes
      '';
    };

    initExtra = ''
      rand=$(($RANDOM % 2))

      if [ $rand -eq 0 ]
      then
        krabby random
      else
        colorscript random
      fi
    '';

    shellAliases = {
      reload = "source ~/.zshrc";
      lg = "lazygit";
      neo = "neofetch";

      # Git
      g = "git";
      ga = "git add";
      gp = "git push";
      gpl = "git pull";
      gc = "git commit -m";
      gco = "git checkout";
      gd = "git diff";
      gs = "git status";

      # Unix
      cat = "bat";
      l = "eza -l --icons";
      watch = "viddy";
      share = "woof";

      # Kubernetes
      k = "kubectl";
      kp = "kubectl get pods";
      kc = "kubectx";
      kn = "kubens";

      # Docker
      dstop = "docker stop $(docker ps -a -q) 2>/dev/null";

    };

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
      {
        name = "catppuccin-zsh-syntax-hightlighting";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "zsh-syntax-highlighting";
          rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
          sha256 = "Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
        };
        file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        src = pkgs.zsh-syntax-highlighting;
      }
      {
        name = "enhancd";
        file = "init.sh";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
          rev = "230695f8da8463b18121f58d748851a67be19a00";
          sha256 = "sha256-XJl0XVtfi/NTysRMWant84uh8+zShTRwd7t2cxUk+qU=";
        };
      }
    ];
  };
}
