#!/bin/bash

function silent( )
{
  # https://github.com/timofurrer/.silent
  $* > /dev/null 2>/dev/null
}

echo -n "Font config"
echo -n "==========="

echo -n "Installing font..."
silent wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

silent mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
silent fc-cache -vf ~/.fonts
silent mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
echo -e "\rInstalled font\033[K"

echo -n "Patched font..."

silent wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
silent mv DejaVu%20Sans%20Mono%20for%20Powerline.ttf ~/.fonts/
silent fc-cache -vf ~/.fonts

echo -e "Downloaded, install  and configured font PowerlineSymbols... ok"

echo "You can now vim executing!"
