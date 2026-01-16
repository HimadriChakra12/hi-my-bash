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
  alias pi="${_omb_tmp_sudo}paru -S" # Enoch Merge
  alias ps="${_omb_tmp_sudo}paru -Q" # Enoch Search
  alias psy="${_omb_tmp_sudo}paru -Sy" # Enoch SYNC
  alias pr="${_omb_tmp_sudo}paru -R" # Enoch Remove
  alias pR="${_omb_tmp_sudo}paru -Rs" # Enoch Remove with Deps
  alias pu="${_omb_tmp_sudo}paru -Syu" # Enoch Update & Upgrade System
  alias pI="${_omb_tmp_sudo}paru -Si" # Enoch Display Information
fi

if _omb_util_binary_exists pikaur; then
  alias Pi="${_omb_tmp_sudo}pikaur -S" # Enoch Merge
  alias Ps="${_omb_tmp_sudo}pikaur -Q" # Enoch Search
  alias Psy="${_omb_tmp_sudo}pikaur -Sy" # Enoch SYNC
  alias Pr="${_omb_tmp_sudo}pikaur -R" # Enoch Remove
  alias PR="${_omb_tmp_sudo}pikaur -Rs" # Enoch Remove with Deps
  alias Pu="${_omb_tmp_sudo}pikaur -Syu" # Enoch Update & Upgrade System
  alias PI="${_omb_tmp_sudo}pikaur -Si" # Enoch Display Information
fi

if _omb_util_binary_exists yay; then
  alias yi="${_omb_tmp_sudo}yay -S" # Enoch Merge
  alias ys="${_omb_tmp_sudo}yay -Q" # Enoch Search
  alias ysy="${_omb_tmp_sudo}yay -Sy" # Enoch SYNC
  alias yr="${_omb_tmp_sudo}yay -R" # Enoch Remove
  alias yR="${_omb_tmp_sudo}yay -Rs" # Enoch Remove with Deps
  alias yu="${_omb_tmp_sudo}yay -Syu" # Enoch Update & Upgrade System
  alias yI="${_omb_tmp_sudo}yay -Si" # Enoch Display Information
fi
