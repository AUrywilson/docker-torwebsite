#!/bin/bash

# We need the web directory
if [[ ! -d /data/www ]]; then
	echo "No /data/www directory with web files!"
	exit 1
fi
if [[ ! -f /data/www/index.html ]]; then
	echo "WARNING: no index.html in /data/www"
fi

# Make sure tor directories are available
if [[ ! -d /data/tor ]]; then
	mkdir /data/tor
fi
if [[ ! -d /data/tor/web_hidden_service ]]; then
	mkdir /data/tor/web_hidden_service
fi

# Make sure the tor user in this container owns the service
chown -R toranon:toranon /data/tor

# Set file permissions
chmod -R 0600 /data/tor /data/tor/web_hidden_service
# Set directory permissions
chmod 0700 /data/tor/web_hidden_service /data/tor

# Now run tor and our web server
exec /usr/bin/supervisord --nodaemon --configuration /supervisord.conf
