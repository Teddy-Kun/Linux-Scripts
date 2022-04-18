sudo echo -e "#\n# /etc/pacman.conf\n#\n# See the pacman.conf(5) manpage for option and repository directives\n#\n# SPDX-License-Identifier: GPL-3.0-or-later\n#\n# GENERAL OPTIONS\n#\n[options]\n# The following paths are commented out with their default values listed.\n# If you wish to use different paths, uncomment and update the paths.\n#RootDir     = /\n#DBPath      = /var/lib/pacman/\n#CacheDir    = /var/cache/pacman/pkg/\n#LogFile     = /var/log/pacman.log\n#GPGDir      = /etc/pacman.d/gnupg/\n#HookDir     = /etc/pacman.d/hooks/\nHoldPkg     = pacman glibc\n#XferCommand = /usr/bin/curl -L -C - -f -o %o %u\n#XferCommand = /usr/bin/wget --passive-ftp -c -O %o %u\n#CleanMethod = KeepInstalled\nArchitecture = auto\n#IgnorePkg   =\n#IgnorePkg   =\n#IgnoreGroup =\n#NoUpgrade   =\n#NoExtract   =\n# Misc options\n#UseSyslog\nColor\nParallelDownloads = 5\n# We cannot check disk space from within a chroot environment\nCheckSpace\n#VerbosePkgLists\n# By default, pacman accepts packages signed by keys that its local keyring\n# trusts (see pacman-key and its man page), as well as unsigned packages.\nSigLevel    = Required DatabaseOptional\nLocalFileSigLevel = Optional\n#RemoteFileSigLevel = Required\n# NOTE: You must run \x27pacman-key --init\x27 before first using pacman; the local\n# keyring can then be populated with the keys of all official Arch Linux\n# packagers with \x27pacman-key --populate archlinux\x27.\n#\n# REPOSITORIES\n#   - can be defined here or included from another file\n#   - pacman will search repositories in the order defined here\n#   - local/custom mirrors can be added here or in separate files\n#   - repositories listed first will take precedence when packages\n#     have identical names, regardless of version number\n#   - URLs will have \x24repo replaced by the name of the current repo\n#   - URLs will have \x24arch replaced by the name of the architecture\n#\n# Repository entries are of the format:\n#       [repo-name]\n#       Server = ServerName\n#       Include = IncludePath\n#\n# The header [repo-name] is crucial - it must be present and\n# uncommented to enable the repo.\n#\n# The testing repositories are disabled by default. To enable, uncomment the\n# repo name header and Include lines. You can add preferred servers immediately\n# after the header, and they will be used before the default mirrors.\n#[testing]\n#Include = /etc/pacman.d/mirrorlist\n[core]\nInclude = /etc/pacman.d/mirrorlist\n[extra]\nInclude = /etc/pacman.d/mirrorlist\n#[community-testing]\n#Include = /etc/pacman.d/mirrorlist\n[community]\nInclude = /etc/pacman.d/mirrorlist\n# If you want to run 32 bit applications on your x86_64 system,\n# enable the multilib repositories as required here.\n#[multilib-testing]\n#Include = /etc/pacman.d/mirrorlist\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n# An example of a custom package repository.  See the pacman manpage for\n# tips on creating your own repositories.\n#[custom]\n#SigLevel = Optional TrustAll\n#Server = file:///home/custompkgs\n" > ~/pacman.conf
sudo cp /etc/pacman.conf /etc/pacman.conf.bak
sudo cp ~/pacman.conf /etc/pacman.conf
sudo rm -rf ~/pacman.conf
sudo pacman -Syu
echo Are you in a VirtualBox VM? n/Y
read vbox
if [ $vbox = "Y" ] || [ $vbox = "y" ]
then
    sudo pacman -S tree go base-devel firefox discord git steam winetricks samba grub-customizer gparted extra-cmake-modules plasma-framework gst-libav mpv python python-websockets qt5-declarative qt5-websockets qt5-webchannel vulkan-headers vlc adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-hk-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-hk-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-sans-fonts adobe-source-serif-fonts noto-fonts-emoji ark unrar kcalc kdenlive obs-studio virtualbox-guest-utils p7zip
else
    sudo pacman -S tree go base-devel firefox discord git steam winetricks samba grub-customizer gparted extra-cmake-modules plasma-framework gst-libav mpv python python-websockets qt5-declarative qt5-websockets qt5-webchannel vulkan-headers vlc adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-hk-fonts adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-otc-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts adobe-source-han-serif-hk-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-sans-fonts adobe-source-serif-fonts noto-fonts-emoji ark unrar kcalc kdenlive obs-studio nvidia nvidia-settings bitwarden p7zip
fi

python -m ensurepip --upgrade

mkdir ~/Programs
cd ~/Programs

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo Do you want to install pamac? n/Y
read vbox
if [ $vbox = "Y" ] || [ $vbox = "y" ]
then
    yay -S protontricks protonhax onlyoffice-bin brave-bin goverlay spotify qimgv pamac-all
else
    yay -S protontricks protonhax onlyoffice-bin brave-bin goverlay spotify qimgv
fi

cd ~/Programs

#Wallpaper Engine KDE Plugin
# Download source
git clone https://github.com/catsout/wallpaper-engine-kde-plugin.git
cd wallpaper-engine-kde-plugin

# Download submodule (glslang)
git submodule update --init

# Configure
mkdir build && cd build
cmake .. -DUSE_PLASMAPKG=ON

# Build
make

# Install package (ignore if USE_PLASMAPKG=OFF for system wide installaiton)
make install_pkg
# install lib
sudo make install

cd ~

sudo rm -rf ~/Programs/*

echo "Done!"
echo "Reboot now?" y/N
read reb
if [ $reb = "n" ] || [ $reb = "N" ]
then
    return

reboot
