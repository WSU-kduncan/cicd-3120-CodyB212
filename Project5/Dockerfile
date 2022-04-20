FROM httpd:2.4

COPY . /public-html* /usr/local/apache2/htdocs/

RUN cd htdocs && rm index.html && cp website.html index.html 
