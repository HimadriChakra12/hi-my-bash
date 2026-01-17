#!/usr/bin/env bash
# Created by Jacob Hrbek github.com in 2019

# A local temporary variable
declare _omb_tmp_sudo

# Switch for the use of "sudo"
_omb_tmp_sudo=
if [[ ${OMB_ALIAS_PACKAGE_MANAGER_SUDO+set} ]]; then
  _omb_tmp_sudo=${OMB_ALIAS_PACKAGE_MANAGER_SUDO:+$OMB_ALIAS_PACKAGE_MANAGER_SUDO }
elif [[ ${OMB_USE_SUDO-true} == true ]]; then
  if ((EUID != 0)) && _omb_util_binary_exists sudo; then
    _omb_tmp_sudo='sudo '
  fi
fi

# Portage - Enoch Merge
if _omb_util_binary_exists pacman; then
  alias I="${_omb_tmp_sudo}pacman -S" # Enoch Merge
  alias S="${_omb_tmp_sudo}pacman -Q" # Enoch Search
  alias Sy="${_omb_tmp_sudo}pacman -Sy" # Enoch SYNC
  alias R="${_omb_tmp_sudo}pacman -R" # Enoch Remove
  alias Rs="${_omb_tmp_sudo}pacman -Rs" # Enoch Remove with Deps
  alias U="${_omb_tmp_sudo}pacman -Syu" # Enoch Update & Upgrade System
  alias In="${_omb_tmp_sudo}pacman -Si" # Enoch Display Information
fi

if _omb_util_binary_exists paru; then
  alias pi="paru -S" # Enoch Merge
  alias ps="paru -Q" # Enoch Search
  alias psy="paru -Sy" # Enoch SYNC
  alias pr="paru -R" # Enoch Remove
  alias pR="paru -Rs" # Enoch Remove with Deps
  alias pu="paru -Syu" # Enoch Update & Upgrade System
  alias pI="paru -Si" # Enoch Display Information
fi

if _omb_util_binary_exists pikaur; then
  alias Pi="pikaur -S" # Enoch Merge
  alias Ps="pikaur -Q" # Enoch Search
  alias Psy="pikaur -Sy" # Enoch SYNC
  alias Pr="pikaur -R" # Enoch Remove
  alias PR="pikaur -Rs" # Enoch Remove with Deps
  alias Pu="pikaur -Syu" # Enoch Update & Upgrade System
  alias PI="pikaur -Si" # Enoch Display Information
fi

if _omb_util_binary_exists yay; then
  alias yi="yay -S" # Enoch Merge
  alias ys="yay -Q" # Enoch Search
  alias ysy="yay -Sy" # Enoch SYNC
  alias yr="yay -R" # Enoch Remove
  alias yR="yay -Rs" # Enoch Remove with Deps
  alias yu="yay -Syu" # Enoch Update & Upgrade System
  alias yI="yay -Si" # Enoch Display Information
fi

unset -v _omb_tmp_sudo

clean_packages(){
    read -p "Wanna Clean Packages With config? [y/n]" $opt
    if [[ $opt == y || $opt = yes ]]; then
        sudo pacman -Rns $(pacman -Qdtq)
    else
        sudo pacman -Rs $(pacman -Qdtq)
    fi
    echo "Wanna Clean Caches?"
    read -r
    sudo pacman -Scc
}
