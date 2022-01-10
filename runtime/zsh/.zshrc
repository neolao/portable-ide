# Path to your oh-my-zsh installation.
export ZSH=$IDE_DIRECTORY_PATH/runtime/zsh/oh-my-zsh

if [ ! -d "$ZSH" ]
then
  export CHSH=no
  export RUNZSH=no
  export KEEP_ZSHRC=yes

  ORIGINAL_HOME=$HOME
  export HOME=$IDE_DIRECTORY_PATH/runtime/zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  export HOME=$ORIGINAL_HOME
fi

ZSH_THEME="pygmalion"

source $ZSH/oh-my-zsh.sh
