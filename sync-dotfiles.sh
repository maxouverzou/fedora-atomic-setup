#!/bin/bash
set -ex
rsync -aP dotfiles/ ~
