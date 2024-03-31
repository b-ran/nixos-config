{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dwt1-shell-color-scripts
    krabby
    woof
    nano
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 100000;
      share = true;
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
      gce = "git config user.email";
      gcn = "git config user.name";


      # Unix
      b = "bat";
      watch = "viddy";
      share = "woof";
      wt = "hyprctl clients";
      copyfile="xclip -selection clipboard <";
      cava = "cava -p ~/.cache/wal/colors-cava";

      dsize = "du -hs";
      l = "eza --icons  -a --group-directories-first -1";
      ll = "eza --icons  -a --group-directories-first -1 --long";
      tree = "eza --icons --tree --group-directories-first";
      findw = "grep -rl";

      # Kubernetes
      k = "kubectl";
      kp = "kubectl get pods";
      kc = "kubectx";
      kn = "kubens";

      # Python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

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
    ];
  };
}
