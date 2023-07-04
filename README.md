# :floppy_disk: CLI scripts

I store all my glamorous `zsh` utility scripts in this repository :woman_dancing:

## gummit.sh :inbox_tray:
> because gum + commit, huehue, get it?

**Gummit** is a little interactive Git CLI making conventional commits easy (also mandatory).

It exposes 3 flags:
- `-a`/`--add`
- `-c`/`--commit`
- `-p`/`--push`
  
Flags determine which parts of the process are executed.

Example: 
> `git add` part is handled as a checkbox multiselect, if you have added many files in one commit (you should not have but did!), you might prefer to execute `git add .` and then `zsh ./gummit.sh -cp` to avoid having to check 14638365 checkboxes. 

Gummit depends on two binaries being available in path:

- [`gum`](https://github.com/charmbracelet/gum)
- [`lolcat`](https://github.com/busyloop/lolcat)

`lolcat` dependency can be easily removed, `gum` however provides the core functionality.

## open.sh
**Open** does what it sounds like it does, it opens files. I got tired of `ls -al` to `cd /some/directory` loop, so `open.sh` allows me to change directories until I reach a file I want to open which I can open using whatever command. 

It supports one command line argument which can specify the path from which to begin "opening".

**Open** depends on one binary being available in path:

- [`gum`](https://github.com/charmbracelet/gum)

## f.sh :mag:
**f** is a life-saver in large codebases. It provides an unreasonably fast way to do **full**-text searching - and when I say **full**, boy I mean it. You can search file names, paths and contents all in the same simple interface with interactive selection and everything. All with exact searching, inverse filtering, fuzzy searching, regex and all the goodies `rg` provides.

**f** requires two binaries to be in path:
- [fzf](https://github.com/junegunn/fzf)
- [rg](https://github.com/BurntSushi/ripgrep)
