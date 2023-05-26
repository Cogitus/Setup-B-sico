#!/bin/bash

sudo apt update && sudo apt upgrade -y

# instalando o git (substituir as variaveis de ambiente para fazer a configuração)
GIT_USER=""
GIT_EMAIL=""

if [ -z $GIT_USER ]; then
  echo "Redefinir no script configurações do git"
  exit 0
fi

sudo apt install git-all -y
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"

# instalando programas diversos utilitários
sudo apt install vim tmux neofetch bashtop exa bat curl pkg-config libssl-dev -y

# instalando libs da gnome (para posteriores personalizações)
sudo apt install gnome-tweaks gnome-shell-extensios gnome-screenshot -y

# instalando o telegram
sudo apt install telegram-desktop -y

# adicionando os aliases dos comandos dos utilitarios
ALIASES_FILE="$HOME/.bash_aliases"
if [ ! -e "$ALIASES_FILE" ]; then
  # cria o arquivo
  touch "$ALIASES_FILE"
  
  alias_commands=$(cat << EOF
### abre esse arquivo de configuração com o gedit
alias aliasconf='gedit ~/.bash_aliases'

### alias para criações de NOVOS COMANDOS personalizados
alias foldersize='du -sch .[!.]* * | sort -h'
alias upd='sudo apt update && sudo apt upgrade'

### substituindo nomes de COMANDOS tradicionais por alternativas melhores
alias top='bashtop'
alias cat='batcat'
alias ls='exa' 
EOF
	)
	
	echo "$alias_commands" > $ALIASES_FILE
else
  echo "O arquivo .bash_aliases já existe"
fi

# instalando docker e docker-compose
sudo apt install docker.io docker-compose -y

# instalando vscode
wget -P $HOME/Downloads --content-disposition "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install --fix-broken ./$(ls code*.deb)
rm $HOME/Downloads/code*.deb

# instalando anaconda (requer passagem de parametros durante a instalação)
wget -P $HOME/Downloads --content-disposition "https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh"
bash $(ls Anaconda*.sh)
rm $HOME/Downloads/Anaconda*.sh

conda init
conda config --set auto_activate_base True

# instalando a linguagem rust (escolher opção '1)' )
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
