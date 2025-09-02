Created by Pierre Velozo - https://pierrevelozo.com



How to install my linux rice.

~~~
git clone https://github.com/pierrevelozo/dotfiles.git
sudo apt install i3* dunst nitrogen picom polybar rofi jq
~~~

~~~

rm -rf ~/.config/i3
rm -rf ~/.config/dunst
rm -rf ~/.config/nitrogen
rm -rf ~/.config/picom
rm -rf ~/.config/polybar
rm -rf ~/wallpaper

~~~

Create the symbolic links:

~~~
ln -s ~/dotfiles/i3 ~/.config/i3
ln -s ~/dotfiles/dunst ~/.config/dunst
ln -s ~/dotfiles/nitrogen ~/.config/nitrogen
ln -s ~/dotfiles/picom ~/.config/picom
ln -s ~/dotfiles/polybar ~/.config/polybar
ln -s ~/dotfiles/wallpaper ~/wallpaper
~~~
