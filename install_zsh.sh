#!/bin/bash
sudo apt-get update
sudo apt-get install -y build-essential

set -e

# 安装 zsh
apt install -y zsh git vim
# 将 zsh 设置为系统默认 shell
sudo chsh -s /bin/zsh

#安装oh-my-zsh
sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# 安装autojump
apt install -y autojump

#安装 zsh-autosuggestions ：命令⾏命令键⼊时的历史命令建议插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#安装 zsh-syntax-highlighting ：命令⾏语法⾼亮插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#备份~/.zshrc
cp ~/.zshrc ~/.zshrc_bak

#替换内容 plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)
sudo sed -i -e "s/plugins=(git/plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting/g" ~/.zshrc

#安装 powerlevel10k.git   
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/themes}/powerlevel10k 
sed -i -e 's|ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|g' ~/.zshrc

#添加快捷键
echo "alias cls='clear'" >> ~/.zshrc
echo "alias ll='ls -l'" >> ~/.zshrc
echo "alias la='ls -a'" >> ~/.zshrc
echo "alias vi='vim'" >> ~/.zshrc
echo 'alias grep="grep --color=auto"' >> ~/.zshrc


#更新 ~/.zshrc
zsh&&source ~/.zshrc

#进入配置界面