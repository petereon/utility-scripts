#!/bin/sh

descend_to_dirs(){
    ls -a $dir && result=$(ls -a $dir | gum filter --indicator "​​📂​ " --placeholder "Search...")

    if [[ (-d "$dir/$result") && ($? -ne 130) ]]; then
        dir=$dir/$result
        descend_to_dirs
    fi
}

if [ $# -eq 0 ]; then
    dir=$(pwd)
else
    dir=$1
fi

descend_to_dirs

program=""

if [ -f  "$dir/$result" ]; then
    program=$(gum input --placeholder "Program to open the file with..." --prompt "⚙️ ​ ")
fi

if [[ $program != "" ]]; then
    echo $program \"$dir/$result\"
    eval $program \"$dir/$result\"
else
    echo "​❌​ Error encountered, stopping!"
    return
fi
