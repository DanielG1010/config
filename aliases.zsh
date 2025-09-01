# Ths goes in $ZSH_CUSTOM/aliases.sh
#
# Used to save images in your clipboard to the current directory
alias dimage="xclip -selection clipboard -t image/png -o > \"\$(date +%Y-%m-%d_%T).png\""

# Faster micromamba
alias mic="micromamba"

# Use to copy things to your clipboard from a pipe, e.g.: cat file.txt | copy
alias copy="xsel --clipboard"
