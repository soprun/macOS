#!/usr/bin/env bash

# Get started with Google Cloud Platform

cloud_project="publication-273509"
cloud_region="europe-west3"
cloud_zone="europe-west3-a"

app_name="app"
app_namespace="publication"

gcloud config set compute/zone ${cloud_zone}
gcloud config set compute/region ${cloud_region}


# gcloud config set compute/zone europe-west3-a
