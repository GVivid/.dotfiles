# Get all in current directory, not including the directory itself.
macos_dir=$(find "$(pwd)" -maxdepth 1 -type d | tail -n+2)

for entry in "$macos_dir"
do
  ln -s "$entry" ~/.config/.
  echo "$entry"
done


