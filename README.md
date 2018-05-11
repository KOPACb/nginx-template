# Nginx template config.

to start using it clone, copy and generate certs.

+ `git clone https://github.com/KOPACb/nginx-template.git`
+ `./gen_certs.sh`
+  do something like that:   
back up original config:  
`cp /etc/nginx/ /etc/nginx.original/`  
copy template:  
`cd nginx-template && cp -r nginx/ /etc/`  
then you need to merge you configs with /etc/nginx/sites-available/template  
+ `ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/`
+ `service nginx restart`


# setups:
* SSL:  
There is 3 basic ssl templates - old, intermediate and modern. Check it out and make decision what do you need.
By default there is modern enabled and it campatible with Firefox 27, Chrome 30, IE 11 on Windows 7, Edge, Opera 17, Safari 9, Android 5.0, and Java 8 and newer.  
Also you should check out you resolver in templates/resolver, and set it up to ssl_stappling work propertly.
Than get certbot and make some certs from [Let’s Encrypt](https://letsencrypt.org/).   
`./gen_cert.sh` will make some self-signed and diffie-hellman certs for you, but geting an green lock in browser isnt hard.  

* Caching policy:  
There is no template for caching policy. Just set `expires 1d` at location you need.
