#!/bin/sh

mv /usr/local/opt/php71-xdebug/xdebug.so /usr/local/opt/php71-xdebug/xdebug.so.disabled
brew services restart php71
echo "xdebug is now disabled"