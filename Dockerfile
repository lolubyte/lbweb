FROM rockylinux:8

RUN dnf -y update && \
    dnf -y install httpd && \
    dnf -y install httpd-tools && \
    dnf -y install unzip 

RUN mkdir -p /var/www/business

#RUN mkdir -p /var/www/html

COPY  business-2.zip /var/www/business/

WORKDIR /var/www/business

RUN  unzip -qq  business-2.zip

RUN  cp -r business-2/* /var/www/html/

RUN  cp -r __MACOSX  /var/www/html/

EXPOSE  80

CMD  [ "/usr/sbin/httpd", "-D", "FOREGROUND"]
