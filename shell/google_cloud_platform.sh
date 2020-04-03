#!/usr/bin/env bash

# ssh-keygen -f "$HOME/.ssh/google_cloud_platform" -C "develop" -t rsa -b 4096 -N ''

# Get started with Google Cloud Platform

# export
# export gcloud_ssh_key="$HOME/.ssh/google_cloud_platform"

#gcloud_user="develop@soprun.com"
#gcloud_ssh_key="$HOME/.ssh/id_gcloud"
#
#if [[ ! -f "$gcloud_ssh_key" ]]; then
#    echo "$gcloud_ssh_key does not exist!"
#    ssh-keygen -b 2048 -C ${gcloud_user} -f ${gcloud_ssh_key} -N '' -t rsa
#fi
#
#alias copy-gcloud="pbcopy < ~/.ssh/$gcloud_ssh_key.pub"

#function ssh-gcloud() {
#    ( ssh -i ~/.ssh/id_rsa -l ${gcloud_user} -L $* )
#}


# google-ssh

# ssh -A internal-ip
# ssh -i [your-private-key].pem bitnami@35.246.178.14

# gcloud compute ssh bitnami-ghost-2160
