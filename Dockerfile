FROM alpine
LABEL maintainer="https://keybase.io/tcely"

RUN apk --update upgrade && \
    apk add openldap openldap-clients \
    openldap-back-bdb openldap-back-hdb openldap-back-mdb openldap-back-ldap && \
    mkdir /var/run/openldap && \
    chown -R ldap:ldap /var/run/openldap && \
    rm -rf /var/cache/apk/*

EXPOSE 636 636/udp 389 389/udp
ENTRYPOINT ["/usr/sbin/slapd", "-u", "ldap", "-g", "ldap"]
CMD ["-d", "0", "-f", "/etc/openldap/slapd.conf", "-h", "ldap:/// ldaps:///"]
