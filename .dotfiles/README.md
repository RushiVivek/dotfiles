# Dotfiles

> *Configurability is the root of all evil...*

This method is based on [this](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git) which is based on [this](https://news.ycombinator.com/item?id=11070797).

## Setup
```sh
git init --bare ~/.dotfiles
alias -s dotfiles '/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles config status.showUntrackedFiles no
dotfiles remote add origin https://github.com/RushiVivek/dotfiles.git
```

## Usage
```sh
dotfiles status
dotfiles add .fish_profile
dotfiles commit -m "Added .fish_profile"
dotfiles push
```

## Fresh install setup
```sh
git clone --seperate-git-dir="$HOME/.dotfiles" https://github.com/RushiVivek/dotfiles.git temp_dotfiles
rsync --recursive --verbose --exclude '.git' temp_dotfiles/ $HOME/
rm --recursive temp_dotfiles
```
