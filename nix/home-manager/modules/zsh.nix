{config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh-vi-mode

  ];
  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
      };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      set -o vi
      eval "$(direnv hook zsh)"
      '';
    #interactiveShellInit = ''
    #  '';
    plugins = [
    {
      name = "vi-mode";
      src = pkgs.zsh-vi-mode;
      file = "/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
    }
    ];
  };
  
}
