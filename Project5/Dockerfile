FROM httpd:2.4

COPY . /cicd-3120-CodyB212/Project5/website/ /usr/local/apache2/htdocs/

RUN cd htdocs && rm index.html && cp website.html index.html 
