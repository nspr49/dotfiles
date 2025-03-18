set paths ~/documents/uni/Mikroprozessortechnik ~/documents/uni/functional_programming ~/documents/uni/functional_programming/ ~/documents/uni/digitaltechnik/

# ($env.home | path join )
# ($env.home | path join documents/uni/WAI/)
# ($env.home | path join documents/uni/digitaltechnik/)

hyprshot -m region -o (printf '%s\n' $paths | fzf )
