#!/bin/zsh

echo "\n" 🔧 Creating an $(echo "(un)conventional" | lolcat)commit! "\n"

exit_if_130 (){
    if  [ $? -eq 130 ]; then
        echo "SIGINT caught! Exiting!" 
        exit 1
    fi
}

TYPE=$(gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
exit_if_130
SCOPE=$(gum input --placeholder "scope")
exit_if_130
# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"

# Pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
exit_if_130

DESCRIPTION=""
gum confirm "Add long description?" && DESCRIPTION=$(gum write --placeholder "Details of this change")
exit_if_130

echo Generated following command: $(echo git commit -m \"$SUMMARY\" -m \"$DESCRIPTION\" | lolcat)

# Commit these changes
gum confirm "Execute?" && git commit -m "$SUMMARY" -m "$DESCRIPTION" || echo "Nothing commited!"