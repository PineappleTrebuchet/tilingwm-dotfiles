local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user='%{$fg[green]%}%n%{$reset_color%}'
local at='%{$fg[green]%}@%{$reset_color%}'
local host='%{$fg[green]%}%m%{$reset_color%}'

local current_dir='%{$fg[blue]%}%3~%{$reset_color%}'
local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'

PROMPT="${user}${at}${host} ${current_dir} ${git_branch}
%{$fg[magenta]%}»%{$reset_color%} "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}"

# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✹%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%}➜%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[blue]%}═%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%}󰓎%{$reset_color%}"
