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
