#!/bin/sh
todoist-cli  list -f '(today|overdue)' -p | cut -d " " -f1 --complement | lolcat