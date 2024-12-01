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
        uni = "cd ~/documents/uni/";
        com = "cd ~/documents/Compilerbau/new_skellet/spl-compiler-skeleton/c/";
        creNo = "~/dotfiles/utils/create_notebook.sh";
        muni = "~/dotfiles/muni.sh";
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
