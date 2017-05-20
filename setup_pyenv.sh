!#/usr/bin/env bash

# run pyenv installer
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

# create pyenv initialisation script
cat <<'EOT' > $HOME/.pyenvrc
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOT

# add pyenv inititalisation script to .profile
if ! grep -q -F 'source $HOME/.pyenvrc' $HOME/.profile; then
cat <<-'EOT' >> $HOME/.profile	

	# initialise pyenv
	source $HOME/.pyenvrc
	EOT
fi

# update pyenv
source $HOME/.pyenvrc
pyenv update

# install python build dependencies
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev

# install python 3.6.1 as default
pyenv install 3.6.1
pyenv global 3.6.1

