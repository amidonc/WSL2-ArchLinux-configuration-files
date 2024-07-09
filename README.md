8![alt text][logo]

[logo]: https://archlinux.org/static/logos/archlinux-logo-dark-1200dpi.b42bd35d5916.png "Arch BTW"

# Preperation

acquire an installation image and prepare USB installation media

Copy files from [arch-usb](arch-usb/) folder to USB installation media


# Install from USB installation media

boot from archlinux install media

connect to wireless network
```
iwctl device list
iwctl station <device> scan
iwctl station <device> get-networks
iwctl station <device> connect <network SSID>
```
enter passphrase when prompted

update archinstall
```
pacman -Sy
pacman -S archinstall
```

mount usb stick
```
mkdir /mnt/usb/
mount /dev/sdxx /mnt/usb
```

copy custom archinstall scripts from /mnt/usb/arch-usb/archinstall to /usr/lib/python3.12/site-packages
```
cp -R /mnt/usb/arch-usb/archinstall /usr/lib/python3.12/site-packages
```
run archinstall with user_configuration.json file
```
archinstall --config /mnt/usb/arch-usb/user-configuration.json
```
configure disk
```
disk configuration
  partitioning
    use a best-effort default partition layout
      select disk
      select filesystem
      yes, use default subvolume structure
      use compression
  LVM
    default layout
    btrfs filesystem
    yes, use default subvolume structure
    use compression
```
disk encryption
```
disk encryption
  encryption type
    LVM on LUKS
  encryption password
  partitions
    select partition to encrypt
```
hostname
```
hostname
  enter a hostname
```
root password and create user
```
root password
  enter root password or leave blank to disable root login
user account
  add a user
    enter a username
    enter a password
    yes, give user sudo rights
confitm and exit
```
install
```
install
  press <Enter> to continue
```

after install, choose 'yes' to enter chroot

change the umask for the efi or boot partition in your fstab to "fmask=0077,dmask=0077"
```
vim /etc/fstab
# /dev/sda1
UUID=<uid>  /boot  vfat  FW,relatime,fsmask=0077.dmask077,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro  0 2
```

create a symbolic link to kitty from xterm
```
ln -s /bin/kitty /bin/xterm
```
exit chroot, reboot system
```
exit
reboot
```

<br/>

# System Configuration

#### configure snapper
unmount and delete .snapshots
```
sudo umount /.snapshots
sudo rm -r /.snapshots/
```
create snapper configuration files
```
sudo snapper -c root create-config /
sudo snapper -c home create-config /home
```
list subvolumes with btrfs and remove old .snapshots volume
```
sudo btrfs subvolume list /
sudo btrfs subvolume delete /.snapshots

sudo mkdir /.snapshots
sudo mount -a
```
setting the default to @
```
sudo btrfs subvol get-default /
sudo btrfs subvol list /
```
use id from path @
```
sudo btrfs subvolume set-default 256 /
sudo btrfs subvol get-default /
```
list snapshots
```
sudo snapper ls
```
create baseline snapeshot

```
sudo snapper -c root create --description "base install" 
```

#### OpenSSL key
generate rsa key if needed
```
ssh-keygen -t ed25519 -C "email@example.com"
eval "$(ssh-agent -s)"
```
**returns your agent pid**
```
Agent pid xxxxx
```
```
ssh-add ~/.ssh/id_ed25519
```
Permissions
```
chmod 700 ~/.shh	
chmod 644 ~/.ssh/authorized_keys ~/.ssh/known_hosts ~/.ssh/config ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
```

#### clone dotfiles

Check out the dotfiles repo in your $HOME directory using git
```
cd ~/
git clone git@github.com:amidonc/dotfiles.git
cd dotfiles
```
use GNU stow to create symlinks
```
stow .
```
 
#### Yay Package Manager
```
cd /opt
sudo git clone https://aur.archlinux.org/yay.git  
sudo chown -R <username>:users ./yay
cd yay
makepkg -si
```

#### Update Archlinux
```
yay -Syu
```

pleanup packages
```
pacman -Rns $(pacman -Qdtq)
```

#### Set default shell to zsh
```
chsh -s /bin/zsh
```

#### Check and install missing firmwares
```
mkinitcpio -p linux
```
shows 'Possibly missing firmware for module: 
such as aic94xx-firmware & wd719x-firmware

search yay and install the firmwares
```
yay -Ss aic94xx
yay -Si aic94xx-firmware
```

If you're unable to find it doing a seach, run modinfo to see 
if you can find something using whats in the description or
depends fields
```
modinfo <module>
```
#### Configure /etc/vconsole.conf
run systemd-vconsole-setup  to create /etc/vconsole.conf
```
sudo /usr/lib/ayatemd/./systemd-vconsole-setup
```
view consle fonts
```
ls -l /usr/share/xbd/consolefonts/
```
edit /etc/vconsole.conf, add font
```
sudo vim /etc/vconsole.conf

FONT=viscii10-8x16
```


FONT=

#### Link xterm to foot - for rofi running terminal apps
```
ln -s /bin/foot /bin/xterm
```
