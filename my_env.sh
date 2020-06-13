#! /bin/bash -l

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh

echo 'source $HOME/.git-completion.bash' >> ~/.bashrc
echo 'source $HOME/.git-prompt.sh' >> ~/.bashrc

echo 'GIT_PS1_SHOWDIRTYSTATE=1' >> ~/.bashrc
echo 'GIT_PS1_SHOWUPSTREAM=1' >> ~/.bashrc
echo 'GIT_PS1_SHOWUNTRACKEDFILES=1' >> ~/.bashrc
echo 'GIT_PS1_SHOWSTASHSTATE=1' >> ~/.bashrc

echo 'export PS1="\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\W\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ "' >> ~/.bashrc

touch ~/.inputrc
echo 'set completion-ignore-case on' >> ~/.inputrc

. ~/.bashrc
