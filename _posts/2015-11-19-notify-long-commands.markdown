---
layout: post
title:  "Get notified on slow commands"
date:   2015-11-19 14:00:00
categories: fish shell
---
We are all lazy and we are all get distracted.
One thing which happens really often is: You run some slow command in your
shell, switch to the browser and baaaaam, you are distracted.

What about sending an OS notification, everytime your command need longer than let's say 10 seconds ...
so you can get right back on track after this time.

Note: This is for [Fish shell](http://fishshell.com/), which is a modern shell and really nice to use.

After each command a new line is printed and the shell prints out the prompt.
On that time, we could provide a notification.

So we create a new file, let's call it rpromt.fish
```
unction fish_right_prompt
    if test $CMD_DURATION
        # Store duration of last command
        set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')

        # OS X notification when a command takes longer than notify_duration
        set notify_duration 10000
        set exclude_cmd "zsh|bash|less|man|more|ssh|drush php"
        if begin
                test $CMD_DURATION -gt $notify_duration
                and echo $history[1] | grep -vqE "^($exclude_cmd).*"
            end

            # Only show the notification if iTerm is not focused
            echo "
                tell application \"System Events\"
                    set activeApp to name of first application process whose frontmost is true
                    if \"iTerm\" is not in activeApp then
                        display notification \"Finished in $duration\" with title \"$history[1]\"
                    end if
                end tell
                " | osascript
        end
    end
end
```

and reference that inside the main fish config file: ~/.config/fish/config.fish:

```
. ~/config/fish/functions/rpromt.fish
```
