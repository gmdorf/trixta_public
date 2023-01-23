sudo apt-get -y install git curl unzip build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk inotify-tools 

sudo chmod 755 ~ 
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2 
source ~/.asdf/asdf.sh 
printf '\nsource ~/.asdf/asdf.sh' >> ~/.bashrc 

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git 
asdf install nodejs latest:16 
asdf global nodejs latest:16 
asdf reshim 
node -v 
npm -v 

asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git 
asdf install erlang 25.2.1 
asdf global erlang 25.2.1 
asdf reshim 

asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git 
asdf install elixir 1.14.3-otp-25 
asdf global elixir latest 
asdf reshim 
elixir --version 


asdf plugin-add python 
asdf install python latest 
asdf global python latest 
asdf reshim 
pip --version

asdf plugin-add rust https://github.com/code-lever/asdf-rust.git 
asdf install rust latest 
asdf global rust latest 
asdf reshim 
rustc --version 

[ ! -f ~/.ssh/id_ed25519.pub ]  ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519
printf "\nCopy this ssh key to gitlab. Use Ctrl-Shift-C not Ctrl-C!\n"
cat ~/.ssh/id_ed25519.pub
printf "\n"
read -p ""

cd ~
git clone git@gitlab.com:trixta/platform/trixta_space.git
cd trixta_space
git submodule update --init --recursive
mix deps.get
cd assets && npm install && cd ..

sudo mkdir /var/lib/trixta/mnesia
sudo chmod -R 777 /var/lib/trixta/mnesia
sudo mkdir /var/lib/trixta
sudo chown $USER /var/lib/trixta

printf '\nsource ~/trixta_space/.envrc' >> ~/.bashrc
