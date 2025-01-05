{ config, pkgs, ...}:
{


  programs.home-manager.enable = true;
  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
      default_tab_template {
        pane size=2 borderless=true {
          plugin location="file://${pkgs.zjstatus}/bin/zjstatus.wasm" {
            format_left   "#[fg=#cba6f7,bold]{mode} "
              format_center "{tabs}"
              format_right  "{command_git_branch}"
              format_space  ""

              border_enabled  "false"
              border_char     "─"
              border_format   "#[fg=#cba6f7{char}"
              border_position "top"

              mode_normal  "#[bg=blue,fg=#1e1e2e] {name} "
              mode_pane    "#[bg=#cba6f7,fg=#1e1e2e] {name}"
              mode_scroll  "#[bg=#cba6f7,fg=#1e1e2e] {name}"
              mode_locked        "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_resize        "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_pane          "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_tab           "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_scroll        "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_search        "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_rename_tab    "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_rename_pane   "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_session       "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_prompt        "#[bg=#cba6f7,fg=#1e1e2e] {name} "
              mode_tmux          "#[bg=#cba6f7,fg=#1e1e2e] {name} "              

              tab_normal   "#[fg=#6C7086] {name} "
              tab_active   "#[fg=#cba6f7,bold,italic] {name} "

              command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
              command_git_branch_format      "#[fg=blue] {stdout} "
              command_git_branch_interval    "10"
              command_git_branch_rendermode  "static"

              datetime        "#[fg=#6C7086,bold] {format} "
              datetime_format "%A, %d %b %Y %H:%M"
              datetime_timezone "Europe/Berlin"
          }
        }
        children
      }
    }
  '';
}
