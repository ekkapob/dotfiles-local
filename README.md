### Awesome Dev Environment

##### Enable vi keys binding in zsh shell, edit `.zshrc` to have:
```
# Allow ESC to enter vi mode 
bindkey -v
```

##### Install Karabiner for speeding up repeat keys
https://pqrs.org/osx/karabiner/index.html.en

At configuration, set `Key Repeat`
- Turn `on` Overwrite the key repeat
- `180` ms to Delay until repeat
- `50` ms to Key repeat 

##### Install Seil
(if want to map `caps lock` to `ESC`, useful for vi key bindings) 
https://pqrs.org/osx/karabiner/seil.html.en

##### Install MacVim
https://github.com/macvim-dev/macvim/releases

Create a link for mvim `command`
```
$ cd /usr/local/bin
$ ln -s /Applications/MacVim.app/Contents/bin/mvim mvim
```

##### Install Pathogen
https://github.com/tpope/vim-pathogen

- Install essentials plugins like NERDTree, CtrlP
http://vimawesome.com/

##### Install the_silver_searcher for faster code search
```
$ brew install the_silver_searcher
```
##### Install dotfiles essential tools
````
$ brew update
$ brew doctor
$ brew tap thoughtbot/formulae
$ brew install rcm
````
##### Install Thoughtbot dotfiles
https://github.com/thoughtbot/dotfiles
Comment Thoughtbot Vim bundlers
```
" Define bundles via Github repos
" Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-surround'
" Plug 'vim-scripts/tComment'
...
```

**Attention:**

Installing dotfiles will replace local ones.
See local dotfile customization
(https://github.com/thoughtbot/dotfiles#make-your-own-customizations) 

_Only when have customized dotfiles (.local)_
```
$ cd
$ git clone git@github.com:ekkapob/dotfiles-local.git
```

Install Thoughtbot dotfiles
````
$ cd
$ git clone git@github.com:thoughtbot/dotfiles.git
$ env RCRC=$HOME/dotfiles/rcrc rcup
````

##### (Optional) VIM Theme
http://ethanschoonover.com/solarized/vim-colors-solarized
##### Map Caps Lock to Ctrl & Esc for Vim speed
http://blog.paulrugelhiatt.com/hacks/apple/2014/11/06/optimize-osx-keymappings-for-web-development.html

##### Issues and Solutions
```
$ brew install neovim
$ pip3 install pynvim
```
