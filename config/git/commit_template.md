# see: https://runebook.dev/ru/docs/git/git-interpret-trailers

Сконфигурируйте шаблон фиксации с некоторыми трейлерами с пустыми значениями (используя sed для отображения и сохранения конечных пробелов в конце трейлеров), затем настройте ловушку commit-msg, которая использует git interpret-trailers для удаления трейлеров с пустыми значениями и добавления git-version трейлера:

```shell
$ sed -e 's/ Z$/ /' >commit_template.txt <<EOF
> ***subject***
>
> ***message***
>
> Fixes: Z
> Cc: Z
> Reviewed-by: Z
> Signed-off-by: Z
> EOF
$ git config commit.template commit_template.txt
$ cat >.git/hooks/commit-msg <<EOF
> #!/bin/sh
> git interpret-trailers --trim-empty --trailer "git-version: \$(git describe)" "\$1" > "\$1.new"
> mv "\$1.new" "\$1"
> EOF
$ chmod +x .git/hooks/commit-msg
```

# git config --global  commit.template commit_template.txt

[commit]
	template = commit_template.txt
