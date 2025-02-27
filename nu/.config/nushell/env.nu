
$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt

let normal_color = (ansi { fg:"#cba6f7" })
$env.PROMPT_INDICATOR_VI_INSERT = { || $"($normal_color)❯ " }

$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_NORMAL = { || $"($normal_color)❮ " }

$env.PROMPT_MULTILINE_INDICATOR = { || $"($normal_color)❯ " }



# ---------------- Config table --------------
$env.config.table.mode = 'psql'
