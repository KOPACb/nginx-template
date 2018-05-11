#!/bin/bash
#some initial values
site_name='*'
email_address='admin@example.com'
organization=''
organizational_unit=''
country='MW'
state='SS'
city='EH'
#initial path

CERTDIR='/etc/ssl/certs/'
CERTNAME='default_ss'

DHPARAM='/etc/ssl/certs/dhparam.pem'
DHSTRENGTH=4096

KEY=$CERTDIR'/'$CERTNAME'.key'
CSR=$CERTDIR'/'$CERTNAME'.csr'

#make shure there is dir to place certs
mkdir -p $CERTDIR

#gencert
echo -e "Making ssl serts:"
openssl req -new -nodes -x509 -newkey rsa:4096 \
        -keyout $CERTDIR/$CERTNAME.key -out $CERTDIR/$CERTNAME.crt \
        -subj "/CN=$site_name/O=$organization/OU=$organizational_unit/C=$country/ST=$state/L=$city"

#gen Diffie-Hellman
echo -e "Making DH:"
#uncomment this if you want get strong-primes algorythm ( it take really long time )
#openssl dhparam -out $DHPARAM $DHSTRENGTH
#faster Diffie-Hellman algorhytm, that uses DSA-like.
openssl dhparam -dsaparam -out $DHPARAM $DHSTRENGTH

#genpem
cat $CERTDIR/$CERTNAME.crt $CERTDIR/$CERTNAME.key > $CERTDIR/$CERTNAME.pem
