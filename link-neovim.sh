#!/bin/bash

### link-neovim.sh
#
# Generates the neovim config directory in the default location and creates
# symbolic links to this folder there.
#

link_neovim () {

	# Declare local variables.

	local vim_config_folder="$HOME/.vim"

	if ! test -d "$vim_config_folder"; then

		echo
		echo "The folder $vim_config_folder does not exits. Aborting..."

		exit -1

	fi

	echo
	echo "Linking neovim to $vim_config_folder…"

	local vimrc_path="$vim_config_folder/vimrc"

	local vim_pack_dir="$vim_config_folder/pack"

	local vim_colors_dir="$vim_config_folder/colors"

	local nvim_config_folder="$HOME/.config/nvim"

	local nvim_vimrc_path="$nvim_config_folder/vimrc"

	local nvim_pack_dir="$nvim_config_folder/pack"

	local nvim_colors_dir="$nvim_config_folder/colors"

	## Generate the config directory, if it does not already exist.

	echo
	echo "Generating neovim config folder in ${nvim_config_folder}…"

	mkdir -p $nvim_config_folder

	local exitcode=$?

	if test $exitcode -ne 0; then

		echo
		echo "Folder generation failed with exit code $exitcode…"

		exit 1

	fi

	echo
	echo "Linking ${nvim_vimrc_path} to ${vimrc_path}…"

	ln -s "$vimrc_path" "$nvim_vimrc_path"

	local exitcode=$?

	if test $exitcode -ne 0; then

		echo
		echo "Linking failed with exit code $exitcode…"

		exit 2

	fi

	echo
	echo "Linking ${nvim_pack_dir} to ${vim_pack_dir}…"

	ln -s "$vim_pack_dir" "$nvim_pack_dir"

	local exitcode=$?

	if test $exitcode -ne 0; then

		echo
		echo "Linking failed with exit code $exitcode…"

		exit 3

	fi

	echo
	echo "Linking ${nvim_colors_dir} to ${vim_colors_dir}…"

	ln -s "$vim_colors_dir" "$nvim_colors_dir"

	local exitcode=$?

	if test $exitcode -ne 0; then

		echo
		echo "Linking failed with exit code $exitcode…"

		exit 4

	fi

	echo
	echo "Done."
	echo
}

## Call the function.

link_neovim
