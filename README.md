# mdeff's dotfiles

In general, I try to unify the look ([Solarized] color theme, [Inconsolata] font) and feel ([Vim] key bindings) of my applications.

[solarized]: https://ethanschoonover.com/solarized
[inconsolata]: https://www.levien.com/type/myfonts/inconsolata.html
[vim]: https://www.vim.org

## [Neovim](https://neovim.io)

[`.config/nvim/init.vim`](.config/nvim/init.vim)

* [vim-plug](https://github.com/junegunn/vim-plug), plugin manager
* [sensible.vim](https://github.com/tpope/vim-sensible), sensible defaults
* [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized), [solarized] color scheme
* [vim-airline](https://github.com/vim-airline/vim-airline), status bar
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes), status bar
* [VimDevIcons](https://github.com/ryanoasis/vim-devicons), file type glyphs / icons
* [fugitive.vim](https://github.com/tpope/vim-fugitive), [git] wrapper
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter), git diff in sign column
* [ranger.vim](https://github.com/rafaqz/ranger.vim), browse files with [ranger]
* [grepper](https://github.com/mhinz/vim-grepper), asynchronous search (using [ripgrep](https://github.com/BurntSushi/ripgrep))
* [supertab](https://github.com/ervandew/supertab), tab for completion
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), code completion
* [Asynchronous Lint Engine](https://github.com/w0rp/ale), linting (checking syntax and semantics)
* [vim-autoformat](https://github.com/Chiel92/vim-autoformat), code formating
* [vim-isort](https://github.com/fisadev/vim-isort), sort python imports using [isort](https://github.com/timothycrosley/isort)
* [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc), integration with [pandoc](http://johnmacfarlane.net/pandoc) document converter
* [vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax), syntax highlighting for vim-pandoc
* [vimtex](https://github.com/lervag/vimtex), support for writing [LaTeX] documents
* [surround.vim](https://github.com/tpope/vim-surround), delete / change / add surroundings (parentheses, brackets, quotes, XML tag)
* [sneak.vim](https://github.com/justinmk/vim-sneak), jump to any location specified by two characters
* [startify](https://github.com/mhinz/vim-startify), start screen

## [Ranger]

[ranger]: https://ranger.github.io

* [`.config/ranger/rc.conf`](.config/ranger/rc.conf), general configuration
* [`.config/ranger/commands.py`](.config/ranger/commands.py), custom commands
* [`.config/ranger/rifle.conf`](.config/ranger/rifle.conf), file opener configuration

## [Fish]

[fish]: https://fishshell.com

[`.config/fish/config.fish`](.config/fish/config.fish)

## [Sway], [Wayland] tiling windows manager

[sway]: https://swaywm.org
[wayland]: https://wayland.freedesktop.org

[`.config/sway/config`](.config/sway/config)
[`.config/swaylock/config`](.config/swaylock/config)
[`.config/i3status/config`](.config/i3status/config)

## [i3], [X11] tiling windows manager

[i3]: https://i3wm.org
[X11]: https://www.x.org

[`.config/i3/config`](.config/i3/config)
[`.config/i3status/config`](.config/i3status/config)

Replaced by Sway.
Kept around because Sway [cannot duplicate monitors yet](https://github.com/swaywm/sway/issues/1666).

## [Zathura], document viewer

[zathura]: https://pwmt.org/projects/zathura
[latex]: https://www.latex-project.org
[synctex]: https://github.com/jlaurens/synctex

[`.config/zathura/zathurarc`](.config/zathura/zathurarc)

Great to visualize the PDF while editing the [LaTeX] source with [Neovim].
Supports [SyncTeX] in both directions.

## [sxiv], image viewer

[sxiv]: https://github.com/muennich/sxiv

* [`.config/sxiv/exec/key-handler`](.config/sxiv/exec/key-handler)
* [`.config/sxiv/exec/image-info`](.config/sxiv/exec/image-info)

## [Git]

[git]: https://git-scm.com

* [`.config/git/config`](.config/git/config)
* [`.config/git/attributes`](.config/git/attributes)

## [Tmux], terminal multiplexer

[tmux]: https://github.com/tmux/tmux

[`.tmux.conf`](.tmux.conf)

## [Conda], package and environment manager

[conda]: https://conda.io

[`.condarc`](.condarc)

## [Jupyter], interactive computing

[jupyter]: https://jupyter.org

* [`.jupyter/jupyter_notebook_config.py`](.jupyter/jupyter_notebook_config.py)
* [`.ipython/profile_default/ipython_config.py`](.ipython/profile_default/ipython_config.py)

## Multimedia: [mpd], [ncmpcpp], [mpv]

[mpd]: https://www.musicpd.org
[ncmpcpp]: https://rybczak.net/ncmpcpp
[mpv]: https://mpv.io

* [`.config/mpd/mpd.conf`](.config/mpd/mpd.conf)
* [`.config/ncmpcpp/bindings`](.config/ncmpcpp/bindings)
* [`.config/ncmpcpp/config`](.config/ncmpcpp/config)
* [`.config/mpv/input.conf`](.config/mpv/input.conf)
* [`.config/mpv/mpv.conf`](.config/mpv/mpv.conf)

## [Syncthing], decentralized file synchronization

[syncthing]: https://syncthing.net

[`.config/syncthing/config.xml`](.config/syncthing/config.xml)

## [systemd], system and service manager

[systemd]: https://freedesktop.org/wiki/Software/systemd

* [`.config/systemd/user/ssh-agent.service`](.config/systemd/user/ssh-agent.service)
* [`.config/systemd/user/default.target.wants/`](.config/systemd/user/default.target.wants/)
* [`.config/systemd/user/sockets.target.wants/`](.config/systemd/user/sockets.target.wants/)
