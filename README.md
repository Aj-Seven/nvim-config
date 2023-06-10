<h1 align="center"> nvim-config </h1>

## Highlights. ✨
- It is a simple neovim configuration based on vim script.
- It provide's wide Auto-Suggestion and syntax highlighting on different programming languages.
- The language server is based on coc which is highly configurable, you can configure the coc settings in coc-settings.json file.

## Installation. 🛠️


- First Install Neovim plugin manager by running below command.
- It is essential for Installing the other plugin's related to nvim-config.
``` bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
#### You can refer more on Installation of vim-plug [here](https://github.com/junegunn/vim-plug#installation)

- Now backup Existing neovim config...
``` bash
mv ~/.config/nvim/ nvim.bck
```
- Now clone the repo.
``` bash
git clone https://github.com/Aj-Seven/nvim-config.git ~/.config/nvim
```

- And finally run the command.
``` bash
nvim +PlugInstall
```
<p> It will Install the plugins directly and coc related plugins. </p>

### Enjoy the Coding... 🥳

