#!/bin/sh

# Source xprofile before 'exec'
[ -f ~/.xprofile ] && . ~/.xprofile

exec xmonad
