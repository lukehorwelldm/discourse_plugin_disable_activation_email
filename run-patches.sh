#!/bin/bash

echo "-------------------------------"
echo "Start of Patches"
echo "-------------------------------"

cd $(dirname "$0")

function doPatch() {
    patch -p0 --ignore-whitespace $2 < ./$1
}

doPatch 0001-Prevent-activation-emails.patch /var/www/discourse/app/mailers/user_notifications.rb
doPatch 0002-Force-set-email-from-line.patch /var/www/discourse/app/mailers/user_notifications.rb
doPatch 0003-Suggest-domain-for-usernames.patch /var/www/discourse/spec/components/user_name_suggester_spec.rb

echo "-------------------------------"
echo "End of Patches"
echo "-------------------------------"

