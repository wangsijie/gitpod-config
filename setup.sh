#!/bin/bash
if [[ -z "${GITCONFIG_SILVERHAND}" ]]; then
  echo $GITCONFIG_SILVERHAND | base64 -d > ~/.gitconfig && \
else
  echo $GITCONFIG | base64 -d > ~/.gitconfig && \
fi
chmod 644 ~/.gitconfig

mkdir -p ~/.ssh
[[ ! -z $SSH_PUBLIC_KEY  ]] && \
echo $SSH_PUBLIC_KEY > ~/.ssh/id_rsa.pub && \
chmod 644 ~/.ssh/id_rsa.pub
[[ ! -z $SSH_PRIVATE_KEY  ]] && \
echo $SSH_PRIVATE_KEY | base64 -d > ~/.ssh/id_rsa && \
chmod 600 ~/.ssh/id_rsa

[[ ! -z $GPG_PUBLIC  ]] && \
echo $GPG_PUBLIC > public.key && \
gpg --import public.key
[[ ! -z $GPG_PRIVATE  ]] && \
echo $GPG_PRIVATE > private.key && \
gpg --import private.key
[[ ! -z $GPG_PUBLIC_SILVERHAND  ]] && \
echo $GPG_PUBLIC_SILVERHAND > public.key && \
gpg --import public.key
[[ ! -z $GPG_PRIVATE_SILVERHAND  ]] && \
echo $GPG_PRIVATE_SILVERHAND > private.key && \
gpg --import private.key
