#!/bin/zsh

if [[ $(($RANDOM % 2)) -eq 0 ]]
then
    cowsay $(curl -s https://programming-quotes-api.herokuapp.com/quotes/random | jq ".en") | lolcat
else
    cowthink $(curl -s http://palicanon.codebuckets.com.au/api/quote | jq ".text") | lolcat
fi
echo ""
