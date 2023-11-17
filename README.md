# Nginx template config.

to start using it clone, copy and generate certs.

+ `git clone https://github.com/KOPACb/nginx-template.git`
+ `cd nginx-template`
+ `./gen_certs.sh`
+  do something like that:   
back up original config:  
`cp -r /etc/nginx/ /srv/nginx.original/`  
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

* Restricted content:  
You can add simple_auth in server or location directive by adding  
  ```
    auth_basic           "restricted content";  
    auth_basic_user_file passwd/dontuseme;  
  ```  
  Do not use passwd/dontuseme auth template, generate yourown username@passwords.  
  Just like `openssl passwd` or even `openssl passwd MYSTRONGPASSWORD`.
  Dont use second method, your password will be in ~/.bash_history.


* Gzip:  
There is gzip enabled by default with max comp level. if it will make too much cpu load you can adjust it to lower level. Find it at templates/gzip.

# certbot
For some automation purposes you can add
```
authenticator = webroot
webroot-path = /var/www/html
post-hook = service nginx reload
text = True
```
to `/etc/letsencrypt/cli.ini`

