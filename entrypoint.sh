#!/bin/bash

if [[ ! -f /var/log/auth.log ]]
then
    touch /var/log/auth.log
fi

if [ -n "$PUBLIC_KEYS_URL" ]
then
    curl -s "$PUBLIC_KEYS_URL" >> /home/pythonssh/.ssh/authorized_keys
fi

service ssh start

tail -f /var/log/auth.log
