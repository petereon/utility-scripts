#!/bin/zsh

exit_if_130 (){
    if  [ $? -eq 130 ]; then
        eval $1
        echo "​❌​ SIGINT caught! Exiting!" 
        exit 1
    fi
}

reset_if_was_added (){
    if [[ -v$RESET_COMMAND ]]; then
        gum confirm "Unstage files?" && echo "Unstaging staged files!" && eval $RESET_COMMAND > /dev/null
    fi 
}

if [[ "$*" == *"--add"* || "$*" == *"-"*"a"* || "$#" -eq 0 ]]; then

    echo "📤 Select files to add:"

    STATUS=$(git status -s -u)
    if [ $? -eq 1 ]; then
        echo "​❌​ No files to add! Exiting!" 
        exit 1
    fi

    ADDED=$(echo $STATUS | gum choose --no-limit)
    exit_if_130

    files=""
    for file in $ADDED; do
        files+="$(printf '%s' $file | rev | cut -d ' ' -f1 | rev | tr '\n' ' ' )"
    done
    ADD_COMMAND="git add $files"
    RESET_COMMAND="git reset $files"
    echo Executed: "$(echo $ADD_COMMAND | lolcat)"
    eval $ADD_COMMAND
fi

FAILED=0
if [[ "$*" == *"--commit"* || "$*" == *"-"*"c"* || "$#" -eq 0 ]]; then
    echo "\n" 🔧 Creating an $(echo "(un)conventional" | lolcat)commit! "\n"

    TYPE=$(gum choose "fix" "feat" "docs" "test" "style" "refactor" "build" "ci" "perf" "revert")
    exit_if_130 reset_if_was_added
    SCOPE=$(gum input --placeholder "scope")
    exit_if_130 reset_if_was_added
    # Since the scope is optional, wrap it in parentheses if it has a value.
    test -n "$SCOPE" && SCOPE="($SCOPE)"

    # Pre-populate the input with the type(scope): so that the user may change it
    SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
    exit_if_130 reset_if_was_added

    DESCRIPTION=""
    gum confirm "Add long description?" && DESCRIPTION=$(gum write --placeholder "Details of this change")
    exit_if_130 reset_if_was_added

    COMMIT_COMMAND="git commit -m \"$SUMMARY\" -m \"$DESCRIPTION\""

    echo Generated following command: $(echo $COMMIT_COMMAND | lolcat)
    # Commit these changes
    gum confirm "Execute?" && eval $COMMIT_COMMAND || FAILED=1

    if [ $FAILED -eq 1 ]; then
        echo "​❌​ Nothing commited!"
        gum confirm "Retry?" && eval $ADD_COMMAND && eval $COMMIT_COMMAND && FAILED=0 || FAILED=1
    fi

fi

if [[ "$*" == *"--push"* || "$*" == *"-"*"p"* || "$#" == 0 ]]; then
    if [ $FAILED -eq 0 ]; then
        gum confirm "Push?" && echo "Select origin to push:" && ORIGINS_TO_PUSH=$(git remote | gum choose --no-limit)
        for origin in $ORIGINS_TO_PUSH; do
            echo git push -u $origin
            git push -u $origin
        done
    else
        echo "​❌​ Nothing commited!"
    fi
fi