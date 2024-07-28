# config
Stores configuration files

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) is a nice configure zsh shell with a lot of features ready.


xsel --clipboard 

Can be used to copy stdout to clipboard

cat file.sh | xsel --clipboard 

Now the contents of file.sh are in the clipboard


fzf used to search for patters in filenames within current dir


asciinema  to record commands and outputs, and share with URL


atuin is a tool to manage command hisotry with a sqlite database:
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)

ripgrep is faster than grep, to disable ripgrep fast feature and behave more like grep use -uuu flag
rg 

floorp is a mozilla based opensource web browser highly customizable, syncing, and other great fetures:  [floorp](https://floorp.app/en/)

neovim, it can be install with apt but for a more recent version, which seems to be requried by lunarvim i had to build from source, wasnt easy though, follow instructions well
[neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)

Nice IDE, it might not be very fast, compared to vim or neovim, but it looks to have a lot of things, I'll be trying it
[lvim](https://www.lunarvim.org/docs/installation)

autojump to cd to recent directories easily

starship is a cross-shell-prompt that can make your bash/zsh nice: [starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

cht.sh is a command line tool ( it can also be used without installing using curl ) to query both cheat sheets from several programming languages and linux tools, and also to query general questions from stackoverflow and other services right in your terminal.
All details are [here](https://github.com/chubin/cheat.sh)


To remap the caps lock key to something better, in this case I remap it to Enter:
Change the file with sudo:
```
sudo vim /usr/share/X11/xkb/symbols/pc
sudo rm -rf /var/lib/xkb/*
```

To make the changes load `setxkbmap -layout latam` or if using other keyboard layout like `us` then change `latam` for `us`

Find a lot of cli tools in [charm](https://charm.sh/) currently trying glow and mods

To set pretty format for json file in vim :%!jq .
