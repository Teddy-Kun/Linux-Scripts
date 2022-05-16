mkdir ~/Programs
cd ~/Programs

sudo pacman -Rd --noconfirm --nodeps discover

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf ~/Programs/yay

yay -S --needed --noconfirm yakuake alacritty tree go grub-customizer extra-cmake-modules plasma-framework gst-libav mpv python python-websockets qt5-declarative qt5-websockets qt5-webchannel vulkan-headers vlc adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-hk-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-hk-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-sans-fonts adobe-source-serif-fonts noto-fonts-emoji ark unrar kcalc bitwarden p7zip powerline-fonts thunderbird onlyoffice-bin librewolf-bin qimgv pamac-aur

python -m ensurepip --upgrade

cp ~/Scripts/teddy-bash ~/.bashrc

cd ~/Programs
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
