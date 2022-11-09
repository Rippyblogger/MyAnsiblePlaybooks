#!/bin/bash

0 0 * * */3 /usr/bin/certbot/--apache certonly -n --agree-tos --email {{ certbot_admin_email }} -d {{ inventory_hostname_one }}"