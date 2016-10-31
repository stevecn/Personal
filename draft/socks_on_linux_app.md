using tsocks

apt-get install tsocks

/etc/tsocks.conf
server = 127.0.0.1
server_type = 5
server_port = 1080

usage:

tsocks wget url
tsocks pear
tsocks gems
