BASE=`pwd`
FORCE=1

copyFiles()
{
    if [ $FORCE ] 
    then
        ln -sf $1 $2
    else
        ln -s $1 $2
    fi
}

###Perl
copyFiles $BASE/perl/.perltidyrc ~/.perltidyrc

###Git
copyFiles $BASE/git/.gitconfig ~/.gitconfig
copyFiles $BASE/git/.gitignore_global ~/.gitignore_global

git config --global core.excludesfile ~/.gitignore_global

###Bash
copyFiles $BASE/bash/.bashrc ~/.bashrc

###Vim

###Fonts
copyFiles $BASE/fonts/EnvyCodeR.ttf ~/.fonts/EnvyCodeR.ttf
copyFiles $BASE/fonts/Inconsolata.otf ~/.fonts/Inconsolata.otf
copyFiles $BASE/fonts/ProggyClean.ttf ~/.fonts/ProggyClean.ttf

###Xmodmap
copyFiles $BASE/xmodmap/.Xmodmap ~/.Xmodmap
xmodmap ~/.Xmodmap
