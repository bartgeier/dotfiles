#!/bin/sh

# https://sites.google.com/site/tstyblo/wmctrl
# screen resolution '0,1920,0,1920,1080'

screen_one()
{
        APP=$1
        WORKSPACE=$2
        wmctrl -r "$APP" -t "$WORKSPACE"
        wmctrl -r "$APP" -b 'remove,fullscreen'
        wmctrl -r "$APP" -b 'remove,maximized_vert'
        wmctrl -r "$APP" -b 'remove,maximized_horz'
        wmctrl -r "$APP" -e '0,500,500,500,500'
        wmctrl -r "$APP" -b 'toggle,maximized_vert'
        wmctrl -r "$APP" -b 'toggle,maximized_horz'
}

screen_two()
{
        APP=$1
        WORKSPACE=$2
        wmctrl -r "$APP" -t "$WORKSPACE"
        wmctrl -r "$APP" -b 'remove,fullscreen'
        wmctrl -r "$APP" -b 'remove,maximized_vert'
        wmctrl -r "$APP" -b 'remove,maximized_horz'
        wmctrl -r "$APP" -e '0,2000,200,500,500'
        wmctrl -r "$APP" -b 'toggle,maximized_vert'
        wmctrl -r "$APP" -b 'toggle,maximized_horz'
}

screen_two_left()
{
        APP=$1
        WORKSPACE=$2
        wmctrl -r "$APP" -t "$WORKSPACE"
        wmctrl -r "$APP" -b 'remove,fullscreen'
        wmctrl -r "$APP" -b 'remove,maximized_vert'
        wmctrl -r "$APP" -b 'remove,maximized_horz'
        wmctrl -r "$APP" -e '0,1920,0,960,1080'
        wmctrl -r "$APP" -b 'toggle,maximized_vert'
#        wmctrl -r $APP -b 'toggle,maximized_horz'
}

screen_two_right()
{
        APP=$1
        WORKSPACE=$2
        wmctrl -r "$APP" -t "$WORKSPACE"
        wmctrl -r "$APP" -b 'remove,fullscreen'
        wmctrl -r "$APP" -b 'remove,maximized_vert'
        wmctrl -r "$APP" -b 'remove,maximized_horz'
        wmctrl -r "$APP" -e '0,2880,0,960,1080'
        wmctrl -r "$APP" -b 'toggle,maximized_vert'
#        wmctrl -r $APP -b 'toggle,maximized_horz'
}


screen_one Firefox 0
screen_two_right Thunderbird 0
screen_two_left Skype 0
