sudo apt update

# Misc
sudo apt install git neovim dconf-editor tmux curl cmake
# Plugins need to be installed manually (Vimium)
sudo apt install chromium-browser
setxkbmap -option caps:swapescape

# i3
sudo apt install i3

# Relogin in order to generate default i3 config folder

mkdir ~/backup
cp ~/.bashrc ~/.profile ~/backup

# Polybar

# Deps
#sudo apt install build-essential clang-6.0 cmake pkg-config python3 python3-sphinx
#sudo apt install libcairo2-dev libiw-dev libpulse-dev libxcb-composite0-dev libxcb-randr0-dev libxcb1-dev
#libxcb-util0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

sudo apt install libcairo2-dev libiw-dev libpulse-dev i3-wm libjsoncpp-dev
mkdir -p ~/tools/polybar
git clone https://github.com/polybar/polybar.git ~/tools/polybar
cd ~/tools/polybar
./build.sh
cd ~

git clone https://github.com/adi1090x/polybar-themes ~/tools/polybar-themes
cd ~/tools/polybar-themes/polybar-3
cp -r fonts/* ~/.local/share/fonts
fc-cache -v
cp /etc/fonts/conf.d/70-no-bitmaps.conf ~/backup
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
mkdir -p ~/.config/polybar
cp -r * ~/.config/polybar

cp ~/.config/i3/config ~/backup/i3-default-config
wget -P ~/.config/i3 https://raw.githubusercontent.com/laaksonenl/dotfiles/master/config

# Nvim
mkdir -p ~/.config/nvim
wget -P ~/.config/nvim https://raw.githubusercontent.com/laaksonenl/dotfiles/master/init.vim
wget -P ~/.config/nvim https://raw.githubusercontent.com/laaksonenl/dotfiles/master/coc-settings.json
wget -P ~ https://raw.githubusercontent.com/laaksonenl/dotfiles/master/.vimrc

# Coc requires Node
sudo apt install nodejs
sudo apt install npm

# Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
wget -P ~ https://raw.githubusercontent.com/laaksonenl/dotfiles/master/.tmux.conf
tmux source ~/.tmux.conf

# Autojump
sudo apt install autojump

# Fuzzy finder
sudo apt install fzf

# Ripgrep
sudo apt install ripgrep

# Profile files
mv ~/.profile ~/.bashrc ~/backup
wget -P ~ https://raw.githubusercontent.com/laaksonenl/dotfiles/master/.profile
wget -P ~ https://raw.githubusercontent.com/laaksonenl/dotfiles/master/.bashrc

# i3 wallpaper
sudo apt install feh
cp ~/.config/polybar/wallpapers/bg-secondary.jpg ~/Pictures

# Monitor settings
sudo apt install arandr

# Appearance settings
sudo apt install lxappearance

# File browser
sudo apt install thunar
sudo apt install ranger

# Fix icons in thunar
sudo apt install gnome-icon-theme

# Theme and icons
sudo apt install arc-theme
sudo add-apt-repository -u ppa:snwh/ppa
sudo apt install moka-icon-theme faba-icon-theme

# Command execution
sudo apt install rofi

# Opaque backgrounds
sudo apt install compton

# Font for vim
sudo apt install fonts-firacode

# Fast screenshots
sudo add-apt-repository -y ppa:linuxuprising/shutter
sudo apt install shutter

# Battery life for i3 bar
sudo apt install acpi

# Icons for i3 bar
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme
