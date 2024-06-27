# Install Yay
```
cd /opt
sudo git clone https://aur.archlinux.org/yay.git  
sudo chown -R <username>:users ./yay
cd yay
makepkg -si
```

# Update Archlinux
```
yay -Syu
```

# Set default shell to zsh
```
chsh -s /bin/zsh
```

# Check and install missing firmwares
```
mkinitcpio -p linux
```
** shows 'Possibly missing firmware for module: 
such as aic94xx-firmware & wd719x-firmware **

search yay and install the firmwares
```
yay -Ss aic94xx
yay -Si aic94xx-firmware
```

# OpenSSL key
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
chmod <username>:<group> 700 ~/.shh	
chmod <username>:<group> 644	~/.ssh/authorized_keys ~/.ssh/known_hosts ~/.ssh/config ~/.ssh/id_rsa.pub
chmod <username>:<group> 600	~/.ssh/id_rsa
```          
# Link xterm to foot - for rofu running terminal apps
```
ln -s /bin/foot /bin/xterm
```

#
#
#
#

# OH-MY-ZSH
download & install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   
download & configure powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
   
      change the value of ZSH_THEME in ~/.zshrc
      ZSH_THEME="powerlevel10k/powerlevel10k"
         
configure pl10k:
p10k configure
         
      clone plugins:
         zsh-syntax-highlighting
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
         zsh-autosuggestions
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
         
	activate the plugins:
            in ~/.zshrc add plugins to plugins=() line.
               plugins=( git zsh-syntax-highlighting zsh-autosuggestions)


# bootstrap blackarch
   curl -O https://blackarch.org/strap.sh
   
   set execute bit
      chmod +x strap.sh
   run strap.sh
      sudo ./strap.sh
   enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run
      sudo pacman -Syu
