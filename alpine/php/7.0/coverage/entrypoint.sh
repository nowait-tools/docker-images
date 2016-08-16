#!/bin/bash

envsubst < /etc/php7/conf.d/php.ini.default > /etc/php7/conf.d/00_env.ini
phpdbg7 $@
