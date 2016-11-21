# Serve Web Site via Tor Hidden Service

This docker container is designed to serve a few files in a single directory
via a web server over a Tor hidden service.

# To use:

On the docker host, create a set of directories to house the website and Tor
keys.
* `mkdir /path/to/configdata`
* `mkdir /path/to/configdata/{www,tor}`
Copy the web files in to `/path/to/configdata/www`. The tor directory should
be empty and the container will drop the keys and hostname in there.

Then run it:
`docker run -v /path/to/configdata:/data tor-website`

After the container has started, look in
`/path/to/configdata/tor/web_hidden_service` for the hostname.
