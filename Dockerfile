FROM registry.access.redhat.com/ubi8/ubi:latest
LABEL description="RHEL8-UBI-Base Image for working with with nginx"
MAINTAINER Dmitry Alekhin <dalekhin@redhat.com>
RUN yum install --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos nginx -y && yum upgrade -y
EXPOSE 80
ADD https://raw.githubusercontent.com/epoxsize/ubi_image/master/nginx.conf /etc/nginx/nginx.conf
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
