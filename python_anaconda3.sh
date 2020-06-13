#! /bin/bash -l

# 事前準備
sudo apt install -y build-essential # c++コンパイラ
sudo apt install -y libffi-dev
sudo apt install -y libssl-dev # openssl
sudo apt install -y zlib1g-dev
sudo apt install -y liblzma-dev
sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev # bz2, readline, sqlite3

# pyenv本体のダウンロードとインストール
sudo apt install -y git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# .bashrcの更新
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
. ~/.bashrc

# pyenvがインストールできたかを確認
pyenv -v

# anaconda3の最新を入れる
anaconda_ver=$(pyenv install --list | grep anaconda3-[0-9].[0-9].[0-9] | tail -n 1)
echo ${anaconda_ver}
pyenv install $anaconda_ver

#パスを通す
echo $(eval echo 'export PATH=\"$PYENV_ROOT/versions/${anaconda_ver}/bin:\$PATH\"') | tr -d " " | sed -e "s/export/export /g">> ~/.bashrc

# グローバルに設定
pyenv global $anaconda_ver
