#!/bin/sh

mv /usr/local/opt/php71-xdebug/xdebug.so.disabled /usr/local/opt/php71-xdebug/xdebug.so
brew services restart php71
echo "xdebug is now enabled"