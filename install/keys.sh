
# setup .ssh directory by creating a key
ssh-keygen

# copy over old keys

# set pemiersions on files
chmod 600 ~/.ssh/*
find ~/.ssh -type f -exec chmod 600 {} +
find ~/.ssh -type f -name "*.pub" -exec chmod 644 {} +
# chmod 644 ~/.ssh/authorized_keys

# set permissions on directories
chmod 700 ~/.ssh
find ~/.ssh -type d -exec chmod 700 {} +

# chown user:user authorized_keys
# chown user:user /home/$USER/.ssh

find ~/.ssh -name '.DS_Store' -type f -delete 
