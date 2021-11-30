FROM registry.access.redhat.com/ubi8/ubi AS ubi-micro-build
MAINTAINER Scott McCarty smccarty@redhat.com
RUN mkdir -p /mnt/rootfs
RUN yum install --installroot /mnt/rootfs --releasever 8 --setopt install_weak_deps=false --nodocs -y coreutils-single glibc-minimal-langpack podman-catatonit httpd procps-ng;yum clean all
RUN rm -rf /mnt/rootfs/var/cache/*
RUN rm -rf /mnt/rootfs/var/lib/rpm

FROM scratch AS ubi8-micro-catatonit
COPY --from=ubi-micro-build /mnt/rootfs/ /
ENTRYPOINT [ "/usr/libexec/catatonit/catatonit", "--", "/usr/sbin/httpd", "-D", "FOREGROUND", "-C", "ServerName www.example.com" ]
