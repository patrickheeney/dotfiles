# Add to default paths
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH

# Change default terminal prompt to folder $
export PS1="\W \$"

# Load the shell dotfiles, and then some:
for file in ~/.bash_{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
