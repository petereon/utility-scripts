#!/bin/zsh

exit_code_is (){
    if [ $? -ne $1 ]; then
        echo "`$2` not found"
        exit 1
    fi
}

cowsay --help &>/dev/null
exit_code_is 2 cowsay

lolcat --help &>/dev/null
exit_code_is 0 lolcat

if [[ $(($RANDOM % 2)) -eq 0 ]]
then
    cowsay $(curl -s https://programming-quotes-api.herokuapp.com/quotes/random | jq ".en") | lolcat
else
    cowsay $(curl -s http://palicanon.codebuckets.com.au/api/quote | jq ".text") | lolcat
fi
