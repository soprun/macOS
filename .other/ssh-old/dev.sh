#!/usr/bin/env bash

#killall ssh-agent;

echo -e '----';
test -z ${SSH_AGENT_PID}; echo $?

eval $(ssh-agent -s)

echo -e '----';
test -z ${SSH_AGENT_PID}; echo $?

# ssh-keygen -y -f ${key} -P "password"


# ssh-keygen -p -f ${key_public};
# pbcopy < ${key}.pub;

# cat ${key}.pub;

# ssh-keygen -R example.com

# ssh-keygen -l -f ${key_public};
# ssh-add -L ${key}

# ssh-keygen -R gitlab.com

# ssh-add -K ${key}

# echo ${key};

# ssh -i ${key} -T git@gitlab.com

# ssh-keygen -F gitlab.com;

# ssh-add -K ${key}
# ssh ${identity}@${remote_host}:22


# ssh git@gitlab.com;
#

ssh -vT git@github.com

# ssh-keygen -R [example.com]:222

# ssh -T ${username}@github.com
