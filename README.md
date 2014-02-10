dotfiles
========

My dotfiles, organized as a [homesick](https://github.com/technicalpickles/homesick) *castle*.

## Install

    homesick clone git@github.com:xentek/dotfiles.git
    homesick symlink dotfiles

## Configuration

Since this repository contains a global `.gitconfig`, you will need to set your global `user.name` and `user.email` or git will warn you that your commits will be authored by an inferred user/email. To fix this, just run:

    homesick rc dotfiles

And follow the prompts:

````bash
dotfiles has a .homesickrc. Proceed with evaling it? (This could be destructive) Y
    eval  /Users/xentek/.homesick/repos/dotfiles/.homesickrc
Git user.name:  Eric Marden
Git user.email:  eric@xentek.net 
````

## Notes

  - Feel free to fork this and customize it for your own needs, or just browse the files for inspiration. You probably don't want to clone this directly.
  - Assumes you are using (or want to use) ZSH, prezto (included), rbenv, vim keybindings, and a bunch of other stuff that I rely on.
  - Should be safe for use on linux or mac.
