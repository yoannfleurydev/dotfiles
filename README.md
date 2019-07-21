# DOTFILES

**WM**

I3 (gaps) is my Window Manager. I'm fond of this little gaps between windows.

![Clean](./screenshots/clean.png)
![Dirty](./screenshots/dirty.png)

**Terminal**

Alacritty is my main terminal, it is written in Rust and is very fast. As a
shell, I use FISH, that I find fast too and that has great default integrations.

**Lockscreen**

I use i3lock for the lockscreen. I have a custom script to enable multi-monitor
lockscreen. You can check [the script](./scripts/lock) in this repository.

![Lock sreen](./screenshots/lockscreen.png)

## Purpose

Configuration files used by many softwares on UNIX systems. Use at your own
risk.

- alacritty (terminal configuration)
- cava (terminal visualizer)
- compton
- editorconfig
- fish
- git (code versionning)
- i3 (windows manager)
- morc-menu
- polybar
- rofi
- tmux (terminal multiplexer)
- vim (terminal editor)

## Requirements

Set fish as your login shell :

`chsh -s $(which fish)`

- `arandr` installed to generate your `~/.screenlayout` scripts that will be
  prompted by i3wm on <kbd>MOD</kbd>+<kbd>x</kbd>

## Command Line Interface softwares

- [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) -
  similar to ack but faster
- [tig](https://github.com/jonas/tig) - text mode interface for git
- [ranger](https://github.com/ranger/ranger) - a VIM-inspired file manager
- [k](https://github.com/supercrabtree/k) - ls alternative
- [z](https://github.com/rupa/z) - tracks your most used directories, based on
  'frecency'.
- [pywal](https://github.com/dylanaraps/pywal) - 🎨 Generate and change
  colorschemes on the fly. A 'wal' rewrite in Python 3.
- [fzf](https://github.com/junegunn/fzf) - 🌸 A command-line fuzzy finder
- [fpp](https://github.com/facebook/PathPicker) - Facebook Path Picker
- [ctags](http://ctags.sourceforge.net/) - Generate an indexof names found in
  source and header files of various programming language. Useful for tags
  feature in Vim.
- [xclip](https://github.com/astrand/xclip) - Command line interface to the X11
  clipboard

## Scripts

- **lock** : used as a lockscreen
- **vol** : manage the volume
- **gitweb** : open the remote repository web interface
- **sp** : control spotify in command line interface

## Feedbacks

Suggestions and improvements are welcome on the
[issue panel](https://github.com/yoannfleurydev/dotfiles/issues/new) !
