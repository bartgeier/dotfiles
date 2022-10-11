#!/bin/sh

# https://sites.google.com/site/tstyblo/wmctrl
# screen resolution '0,1920,0,1920,1080'

wmctrl -r Firefox -t 0

wmctrl -r Thunderbird -t 0
wmctrl -r Thunderbird -b 'remove,fullscreen'
wmctrl -r Thunderbird -b 'remove,maximized_vert'
wmctrl -r Thunderbird -b 'remove,maximized_horz'
wmctrl -r Thunderbird -e '0,2000,200,500,500'
wmctrl -r Thunderbird -b 'toggle,maximized_vert'
wmctrl -r Thunderbird -b 'toggle,maximized_horz'

wmctrl -r Skype -t 1
wmctrl -r WhatsApp -t 2
