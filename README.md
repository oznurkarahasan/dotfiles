git clone https://github.com/oznurkarahasan/dotfiles.git ~/dotfiles
cd ~/dotfiles

mv ~/.bashrc ~/.bashrc.bak

ln -s ~/dotfiles/.bashrc ~/.bashrc

source ~/.bashrc

nvim