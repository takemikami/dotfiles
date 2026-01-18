# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# load local settings
for f in `find ~/.zshrc.d/*`; do . $f ; done
