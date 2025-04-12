###Install it with: 

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

`git clone https://github.com/buckey206/dotfiles; sh ~/dotfiles/install.sh`


# Neovim Configuration
## use .vimrc in neovim [Neovim docs - nvim-from-vim](https://neovim.io/doc/user/nvim.html#nvim-from-vim)
add the following to `~/.config/nvim/init.vim`
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

## vim-plug plugins 
[vim-plug: :hibiscus: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug/?tab=readme-ov-file#neovim)

install vim-plug for neovim 
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

