# helix-fzf-integration
Allows for fuzzy finder to jump into helix with different options

## Prerequisites

1) Helix installed
2) fzf installed

## Integration
1) git clone "https://github.com/Urolll/helix-fzf-integration"
2) open the .bashrc file
3) add the following line to it:  
    alias h='source ~/helix-fzf-integration/fzf_script.sh'
4) you may change h to whatever you want to run the command as
5) if you decided to change the alias name, change it in fzf_script.sh as well

## Usage Examples
> h 
// this will open a session of fzf in the current directory, and whatever is selected will be opened in helix

> h -?
// open the manual

> h -h
// fzf session will be in home

> h -hs
// fzf session will be in home and after leaving the file, the session will be in the previous directory

> h -n 20
// the file will be opened on line 20

> h -hn 39
// fzf session will be in home and the file will be opened on line 39
