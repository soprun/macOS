

# get current branch in git repo
function parse_git_branch() {
  BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ ! "${BRANCH}" == "" ]; then
    STAT=$(parse_git_dirty)
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# get current status of git repo
function parse_git_dirty() {
  status=$(git status 2>&1 | tee)
  dirty=$(
    echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
    echo "$?"
  )
  untracked=$(
    echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
    echo "$?"
  )
  ahead=$(
    echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
    echo "$?"
  )
  newfile=$(
    echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
    echo "$?"
  )
  renamed=$(
    echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
    echo "$?"
  )
  deleted=$(
    echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
    echo "$?"
  )
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

export PS1="\u\w\`parse_git_branch\`\\$ "

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]]; then
  export PATH="${HOME}/bin:${PATH}"
fi

BASH_PROFILE_HOME="${BASH_PROFILE_HOME:-~/.bash}"
BASH_PROFILE_BIN="${BASH_PROFILE_BIN:-${BASH_PROFILE_HOME}/bin}"

#if [ ! -d $BASH_PROFILE_PATH ]; then
#  printf "\033[0;31mDirectory ${BASH_PROFILE_PATH} DOES NOT exists.\033[0m" >&2
#fi
#
#if [ ! -d $BASH_PROFILE_BIN ]; then
#  printf "\033[0;31mDirectory ${BASH_PROFILE_BIN} DOES NOT exists.\033[0m" >&2
#fi

#if [[ -f ~/.bashrc ]]; then
#  # shellcheck source=./.bashrc
#  . ~/.bashrc
#fi
#
#if [[ -f ~/.zshrc ]]; then
#  # shellcheck source=./.bashrc
#  . ~/.zshrc
#fi

command_exists() {
  command -v "$@" >/dev/null 2>&1
}
