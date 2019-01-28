#!/bin/bash -e

set -e

nginx -g "daemon off;"

if [ "$HOST_USER" ]; then
  OWNER=$(echo $HOST_USER | cut -d: -f1)
  GROUP=$(echo $HOST_USER | cut -d: -f2)
else
  OWNER=$(stat -c '%u' $PROJECTMAPPINGFOLDER)
  GROUP=$(stat -c '%g' $PROJECTMAPPINGFOLDER)
fi

if [ "$OWNER" != "0" ]; then
  usermod -o -u $OWNER www-data
  groupmod -o -g $GROUP www-data
fi

# Setup timezone
#TZ=Europe/Warsaw
#ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Java for Solr
#apt-get install -y openjdk-8-jdk

#ORIGPASSWD=$(cat /etc/passwd | grep www-data)
#ORIG_UID=$(echo "$ORIGPASSWD" | cut -f3 -d:)
#ORIG_GID=$(echo "$ORIGPASSWD" | cut -f4 -d:)
#ORIG_HOME=$(echo "$ORIGPASSWD" | cut -f6 -d:)
#DEV_UID=${DEV_UID:=$ORIG_UID}
#DEV_GID=${DEV_GID:=$ORIG_GID}

#if [ "$DEV_UID" -ne "$ORIG_UID" ] || [ "$DEV_GID" -ne "$ORIG_GID" ]; then
#    groupmod -g "$DEV_GID" www-data
#    usermod -u "$DEV_UID" -g "$DEV_GID" www-data
#fi

