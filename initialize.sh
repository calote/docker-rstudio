#!/bin/bash

# 
# We will almost certainly will mount an external volume to hold 
# the 'guest' user directory (so that their work persists between
# container restarts). However, there is no guarantee that the
# container user owns or can write to that external volume, so
# make sure they own their home directory
#
chown -R guest ~guest ; chgrp -R users ~guest

#
# set the passwords for the user 'guest' based on environment variable. 
#

# Añadido para definir password: guest  (usar en container docker de qnap)
/bin/echo "guest:guest" | /usr/sbin/chpasswd


if [ ! -z $USERPASS2 ] 
then
  /bin/echo "guest:$USERPASS2" | /usr/sbin/chpasswd
  unset USERPASS2
fi

exit 0
