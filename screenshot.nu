

# possible paths
let paths = [
 ($env.home | path join documents/uni/Mikroprozessortechnik/)
 ($env.home | path join documents/uni/functional_programming/)
 ($env.home | path join documents/uni/WAI/)
 ($env.home | path join documents/uni/digitaltechnik/)
]


hyprshot -m region -o ($paths | fzf | awk -F' ' '{print $4}')




