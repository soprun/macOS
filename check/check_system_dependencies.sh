#!/bin/bash

log_info 'Check system required dependencies'

if ! docker --version >/dev/null 2>/dev/null; then
  log_error 'Command "docker" is not installed.'
fi

if ! docker-compose --version >/dev/null 2>/dev/null; then
  log_error 'Command "docker-compose" is not installed.'
fi

if ! git --version >/dev/null 2>/dev/null; then
  log_error 'Command "git-flow" is not installed.'
fi

#if ! git-flow version >/dev/null 2>/dev/null; then
#  log_error 'Command "git-flow" is not installed.'
#fi

#if ! mkcert --version >/dev/null 2>/dev/null; then
#  log_error 'Command "mkcert" is not installed.'
#fi

if ! openssl version >/dev/null 2>/dev/null; then
  log_error 'Command "openssl" is not installed.'
fi

#if ! shellcheck --version >/dev/null 2>/dev/null; then
#  log_error 'Command "shellcheck" is not installed.'
#fi

log_success 'Check system required dependencies - is succeeded!'
