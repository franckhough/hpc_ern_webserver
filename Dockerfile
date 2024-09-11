# escape=`

FROM rockylinux/rockylinux:9.4
LABEL MAINTANER="Franck Hough"
LABEL EMAIL="hpc@ufs.ac.za"
ENV PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
EXPOSE 5432/tcp
EXPOSE 5432/udp
RUN <<BLOCK
dnf -qy update
dnf install -qy vim nano binutils iputils httpd git-core gitweb iproute procps 
dnf -qy clean all
BLOCK
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY dav.conf /etc/httpd/conf.d/dav.conf
COPY compose.yaml /root/compose.yaml
COPY Dockerfile /root/Dockerfile
ENTRYPOINT ["bash"]
