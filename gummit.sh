#!/bin/zsh

exit_if_130 (){
    if  [ $? -eq 130 ]; then
        echo "​❌​ SIGINT caught! Exiting!" 
        exit 1
    fi
}

echo "📤 Adding files:"

ADDED=$(git status -s -u | gum choose --no-limit)
exit_if_130
for file in $ADDED; do
    echo git add $(echo $file | rev | cut -d ' ' -f1 | rev)
    git add $(echo $file | rev | cut -d ' ' -f1 | rev)
done


echo "\n" 🔧 Creating an $(echo "(un)conventional" | lolcat)commit! "\n"



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

COMMITED=0
# Commit these changes
gum confirm "Execute?" && COMMITED=1 && git commit -m "$SUMMARY" -m "$DESCRIPTION" || echo "​❌​ Nothing commited!"

if [ $COMMITED -eq 1 ]; then
    ORIGINS_TO_PUSH=$(gum confirm "Push?" && echo "Select origins to push:" && git remote | gum choose --no-limit)
    for origin in $ORIGINS_TO_PUSH; do
        echo git push -u $origin
        git push -u $origin
    done
fi