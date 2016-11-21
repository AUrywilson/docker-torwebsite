# This docker container is to support a lab featuring Tor where
# students install Tor browser in their VMs and then demonstrate
# they've completed the lab by accessing this hidden Tor service
FROM fedora
MAINTAINER Ryan Wilson <rywilson@augusta.edu>

RUN dnf install -y supervisor tor python-pip && pip install bottle && useradd -d /home/bottle -m bottle

# This volume contains the web data and the tor state (and private keys) between executions
VOLUME /data

COPY start.sh /start.sh
COPY torrc /etc/tor/torrc
COPY supervisord.conf /supervisord.conf
COPY server.py /home/bottle/

CMD /start.sh
