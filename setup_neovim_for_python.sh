#!/usr/bin/env bash

# see https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
#
# check neovim is installed
command -v nvim >/dev/null 2>&1 || { 
	echo "Aborting: could not find neovim installation." >&2; exit 1; 
}

# check pyenv is installed
command -v pyenv >/dev/null 2>&1 || { 
	echo "Aborting: could not find pyenv installation." >&2; exit 1; 
}

source $HOME/.pyenvrc

# install latest versions of python 2 and 3
declare -A pythonPaths

for version in "2.7.13" "3.6.1"
do
	#echo "$version "
	if ! pyenv versions | grep -q -w "$version"; then
		pyenv install $version
	fi

	version_no=${version:0:1}
	echo "Setting up neovim virtualenv for python $version_no"

	env="neovim$version_no"

	pyenv virtualenv $version $env
	pyenv activate $env
	pip install neovim

	pythonPaths[$version_no]=$(pyenv which python)
done

echo ""
echo "Add the following to your neovim config files (init.vim)"
echo "let g:python_host_prog = '${pythonPaths[2]}'"
echo "let g:python3_host_prog = '${pythonPaths[3]}'"
