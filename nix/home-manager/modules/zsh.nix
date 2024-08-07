{config, pkgs, ... }:
{
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
    eval "$(direnv hook zsh)"

    '';
  };
}
