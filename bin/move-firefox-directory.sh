#!/bin/sh
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

if [ -d $HOME/.mozilla ]; then
    mv $HOME/.mozilla $XDG_DATA_HOME/mozilla
fi

if [ ! -L $HOME/.mozilla ]; then
    ln -s $XDG_DATA_HOME/mozilla $HOME/.mozilla
fi
