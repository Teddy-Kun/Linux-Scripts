mkdir ~/Programs
cd ~/Programs

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf ~/Programs/yay

yay -S tree go grub-customizer gparted extra-cmake-modules plasma-framework gst-libav mpv python python-websockets qt5-declarative qt5-websockets qt5-webchannel vulkan-headers vlc adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-hk-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-hk-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-sans-fonts adobe-source-serif-fonts noto-fonts-emoji ark unrar kcalc bitwarden p7zip powerline-fonts protontricks protonhax onlyoffice-bin librewolf-bin goverlay spotify qimgv pamac-aur

python -m ensurepip --upgrade
