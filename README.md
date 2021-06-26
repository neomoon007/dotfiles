# Dotfiles
this project is just my dotfiles, feel free to use and get inpiration from it.

## Install
  1. Clone the repo
  ```
  git clone https://github.com/neomoon007/dotfiles/
  ```
  
  2. Run stow to link it
  inside dotfiles repo, run this command
  ```
  stow -vt ~ *
  ```
  ***Some advices here, "~" is the path where you're gonna symlink the files,
  so make sure the dotfiles's parent directory is your home directory,
  other wise just change the oath there,***
  
  3. Linking just specific files
  ```
  stow -vt ~ {PATH/FILENAME}
  ```
  
## Uninstall
  1. Deleting all symlinks
  ```
  stow -vDt ~ *
  ```
  
  2. Deleting specific symlinks
  ```
  stow -vDt ~ {PATH/FILENAME}
  ```
