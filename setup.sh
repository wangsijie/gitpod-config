#!/bin/bash
git config --global commit.gpgsign true
[[ ! -z $GITCONFIG_SILVERHAND  ]] && \
git config --global user.signingkey C72642FE24F7D42B || \
git config --global user.signingkey 1EA50084233D66BE
[[ ! -z $GIT_AUTHOR_NAME  ]] && git config --global user.name $GIT_AUTHOR_NAME
[[ ! -z $GIT_AUTHOR_EMAIL  ]] && git config --global user.email $GIT_AUTHOR_EMAIL

~/.ssh/known_hosts
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
git config --global url."git@github.com:".insteadOf "https://github.com/"

mkdir -p ~/.ssh
[[ ! -z $SSH_PUBLIC_KEY  ]] && \
echo $SSH_PUBLIC_KEY > ~/.ssh/id_rsa.pub && \
chmod 644 ~/.ssh/id_rsa.pub
[[ ! -z $SSH_PRIVATE_KEY  ]] && \
echo $SSH_PRIVATE_KEY | base64 -d > ~/.ssh/id_rsa && \
chmod 600 ~/.ssh/id_rsa

[[ ! -z $GPG_PUBLIC  ]] && \
echo $GPG_PUBLIC | base64 -d > public.key && \
gpg --import public.key
[[ ! -z $GPG_PRIVATE  ]] && \
echo $GPG_PRIVATE | base64 -d > private.key && \
gpg --import private.key
[[ ! -z $GPG_PUBLIC_SILVERHAND  ]] && \
echo $GPG_PUBLIC_SILVERHAND | base64 -d > public.key && \
gpg --import public.key
[[ ! -z $GPG_PRIVATE_SILVERHAND  ]] && \
echo $GPG_PRIVATE_SILVERHAND | base64 -d > private.key && \
gpg --import private.key
