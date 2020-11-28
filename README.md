# macOS
Collection bash scripts

- https://github.com/mathiasbynens/dotfiles
- https://github.com/alebcay/awesome-shell
- https://github.com/drduh/YubiKey-Guide
- https://www.freecodecamp.org/news/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38/
- https://www.mgrachev.com/2016/11/17/manage-dependecies-through-homebrew/

- https://github.com/rbenv/rbenv-installer/blob/master/bin/rbenv-doctor

---

`.bash_profile` выполняется для оболочек входа в систему, а `.bashrc` для интерактивных оболочек без входа в систему.

Когда вы входите в систему (вводите имя пользователя и пароль) через консоль, либо сидя за компьютером,
либо удаленно через ssh: `.bash_profile` выполняется для настройки вашей оболочки до начальной командной строки.

Но, если вы уже вошли в свою машину и открыли новое окно терминала (xterm), то `.bashrc` выполняется перед командной
 строкой окна. `.bashrc` также запускается, когда вы запускаете новый экземпляр bash, набирая `/bin/bash` в терминале.

В OS X Terminal по умолчанию запускает оболочку входа в систему каждый раз, так что это немного отличается от
большинства других систем, но вы можете настроить это в настройках.


---

# BASH Debugger

The Bash Debugger Project is a source-code debugger for bash that follows the gdb command syntax.

http://bashdb.sourceforge.net
https://github.com/rocky/zshdb/tree/master/

https://zshdb.readthedocs.io/en/latest/install.html
https://marketplace.visualstudio.com/items?itemName=rogalmic.zsh-debug


---

http://antigen.sharats.me/

---

https://macvim-dev.github.io/macvim/

