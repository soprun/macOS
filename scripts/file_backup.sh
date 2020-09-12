#!/bin/bash

file_backup() {
  local source_file="$1"
  local source_dir="$(
    cd $(dirname $source_file)
    pwd
  )"
  # local target_file="$source_file.backup-$(date "+%Y.%m.%d-%H:%M:%S")"
#  local backup_dir="$source_dir/.backup"
  local backup_dir="$source_dir/.backup-$date_file"
  local backup_file="$backup_dir/$(basename $source_file)"

  if [ ! -f $source_file ]; then
    log_error "File $source_file does not exists."
  fi

  if [ ! -d $backup_dir ]; then
    log_warn "Directory $backup_dir does not exists."
    mkdir $backup_dir
  fi

  if [ -f $backup_file ]; then
    log_warn "File $backup_file is exists."
  fi

  cp $source_file $backup_file
  log_success "File '$source_file' a backup was created '$backup_file'"
}

### Example
# file_backup ../.env
