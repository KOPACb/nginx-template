#!/bin/bash
#some initial values
site_name='*'
email_address='admin@example.com'
organization='organization'
organizational_unit='unit'
country='MW'
state='SS'
city='EH'
#initial path

CERTDIR='/etc/ssl/certs'
CERTNAME='default_ss'

DHPARAM='/etc/ssl/certs/dhparam.pem'
DHSTRENGTH=4096

KEY=$CERTDIR'/'$CERTNAME'.key'
CRT=$CERTDIR'/'$CERTNAME'.crt'
PEM=$CERTDIR'/'$VERTNAME'.pem'
CSR=$CERTDIR'/'$CERTNAME'.csr'

#make shure there is dir to place certs
mkdir -p $CERTDIR

#gencert
echo -e "Making ssl serts:"

#rm -f $KEY
#rm -f $CRT
#rm -f $PEM
#rm -f $CSR

openssl req -new -nodes -x509 -newkey rsa:4096 -nodes \
        -keyout $KEY -out $CRT \
        -subj "/CN=$site_name/O=$organization/OU=$organizational_unit/C=$country/ST=$state/L=$city"

#gen Diffie-Hellman
echo -e "Making DH:"
#uncomment this if you want get strong-primes algorythm ( it take really long time )
openssl dhparam -out $DHPARAM $DHSTRENGTH
#faster Diffie-Hellman algorhytm, that uses DSA-like.
#openssl dhparam -dsaparam -out $DHPARAM $DHSTRENGTH

#genpem
cat $CRT $KEY > $PEM
