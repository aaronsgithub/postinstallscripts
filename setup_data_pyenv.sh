#!/usr/bin/env bash

source $HOME/.pyenvrc

pyenv virtualenv data

pyenv activate data

pip install -U pip

pip install jupyter pandas
