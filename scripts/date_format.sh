#!/bin/bash

# ISO 8601 — международный стандарт, выпущенный организацией ISO, который описывает форматы дат и времени
# и даёт рекомендации для его использования в международном контексте

# 2020-09-12T11:28:36
readonly iso8601=$(date '+%Y-%m-%dT%H:%M:%S')
# 2020.09.12-11:28:36
readonly date_file=$(date '+%Y.%m.%d-%H:%M:%S')
# 2020-09-12-11-28
readonly date_file_dash=$(date '+%Y-%m-%d-%H-%M')

log_debug $iso8601
log_debug $date_file
log_debug $date_file_dash

