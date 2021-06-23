git config --global user.email "buckey206@gmail.com"
git config --global user.name "Jared"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
# This will set the account default identity and the password timeout to 1 hour instead of 15 minutes
ln -s ~/dotfiles/i3 ~/.i3
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/bashrc ~/.bashrc

