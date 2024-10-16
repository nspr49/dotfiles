#!/usr/bin/env bash

# Filename: ~/github/dotfiles-latest/zshrc/colorscheme-set.sh
# ~/github/dotfiles-latest/zshrc/colorscheme-set.sh

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display error messages
error() {
  echo "Error: $1" >&2
  exit 1
}

# Ensure a colorscheme profile is provided
if [ -z "$1" ]; then
  error "No colorscheme profile provided"
fi

colorscheme_profile="$1"

# Define paths
colorscheme_file="./schemes/$colorscheme_profile"
active_file="./active.sh"

# Check if the colorscheme file exists
if [ ! -f "$colorscheme_file" ]; then
  error "Colorscheme file '$colorscheme_file' does not exist."
fi

# If active-colorscheme.sh doesn't exist, create it
if [ ! -f "$active_file" ]; then
  echo "Active colorscheme file not found. Creating '$active_file'."
  cp "$colorscheme_file" "$active_file"
  UPDATED=true
else
  # Compare the new colorscheme with the active one
  if ! diff -q "$active_file" "$colorscheme_file" >/dev/null; then
    UPDATED=true
  else
    UPDATED=false
  fi
fi

generate_kitty_config() {
  kitty_conf_file="$HOME/.config/kitty/curr_theme.conf"

  cat >"$kitty_conf_file" <<EOF
$kitty_colors
EOF

  echo "Kitty configuration updated at '$kitty_conf_file'."
}

generate_starship_config() {
  # Define the path to the active-config.toml
  starship_conf_file="$HOME/.config/curr_starship.toml"

  # Generate the Starship configuration file
  cat >"$starship_conf_file" <<EOF
# This will show the time on a 2nd line
# Add a "\\" at the end of an item, if you want the next item to show on the same line
format = """
\$all\\
\$kubernetes
\$character
"""

[battery]
disabled = true

[gcloud]
disabled = true

[time]
style = '${color04} bold'
disabled = false
format = '[\[\$time\]](\$style) '
# https://docs.rs/chrono/0.4.7/chrono/format/strftime/index.html
# %T	00:34:60	Hour-minute-second format. Same to %H:%M:%S.
# time_format = '%y/%m/%d %T'
time_format = '%y/%m/%d'

# For this to show up correctly, you need to have cluster access
# So your ~/.kube/config needs to be configured on the local machine
[kubernetes]
disabled = false
# context = user@cluster
# format = '[\$user@\$cluster \(\$namespace\)](${color05}) '
# format = '[\$cluster \(\$namespace\)](${color05}) '
# Apply separate colors for cluster and namespace
format = '[\$cluster](${color05} bold) [\(\$namespace\)](${linkarzu_color02} bold) '
# format = 'on [⛵ (\$user on )(\$cluster in )\$context \(\$namespace\)](dimmed green) '
# Only dirs that have this file inside will show the kubernetes prompt
# detect_files = ['900-detectkubernetes.sh']
# detect_env_vars = ['STAR_USE_KUBE']
# contexts = [
#   { context_pattern = "dev.local.cluster.k8s", style = "green", symbol = "💔 " },
# ]

[username]
style_user = '${color04} bold'
style_root = 'white bold'
format = '[\$user](\$style)'
show_always = true

[hostname]
ssh_only = false
format = '[.@.](white bold)[\$hostname](${color02} bold)'

[directory]
style = '${color03} bold'
truncation_length = 0
truncate_to_repo = false

[ruby]
detect_variables = []
detect_files = ['Gemfile', '.ruby-version']
EOF

  echo "Starship configuration updated at '$starship_conf_file'."
}

# If there's an update, replace the active colorscheme and perform necessary actions
if [ "$UPDATED" = true ]; then
  echo "Updating active colorscheme to '$colorscheme_profile'."

  # Replace the contents of active-colorscheme.sh
  cp "$colorscheme_file" "$active_file"

  # Source the active colorscheme to load variables
  source "$active_file"

  # Generate the Kitty configuration file
  generate_kitty_config

  # Set the tmux colors
  #$HOME/github/dotfiles-latest/tmux/tools/linkarzu/set_tmux_colors.sh
  tmux source-file ~/.tmux.conf
  echo "Tmux colors set and tmux configuration reloaded."

  # Set sketchybar colors
  
  #generate_starship_config

  # This reloads kitty config without closing and re-opening
  kill -SIGUSR1 "$(pgrep -x kitty)"
fi
