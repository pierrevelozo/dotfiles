Created by Pierre Velozo - https://pierrevelozo.com



How to install my linux rice.

~~~
git clone https://github.com/pierrevelozo/dotfiles.git
sudo apt install i3* dunst nitrogen picom polybar rofi jq
~~~

~~~
rm -f ~/.config/i3
rm -f ~/.config/dunst
rm -f ~/.config/nitrogen
rm -f ~/.config/picom
rm -f ~/.config/polybar
rm -f ~/wallpaper
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
