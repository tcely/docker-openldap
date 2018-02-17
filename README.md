# docker-openldap
Docker image of OpenLDAP (slapd) based on Alpine Linux


#### Example `docker-compose.yml`
```yaml
version: '3'
services:
  slapd:
    image: 'tcely/openldap'
    restart: 'unless-stopped'
    hostname: 'ldap.example.net'
    healthcheck:
      test:
        - 'CMD'
        - '/usr/bin/ldapwhoami'
        - '-x'
        - '-v'
        - '-H'
        - 'ldaps://ldap.example.net/'
      interval: '30s'
      timeout: '10s'
      retries: 2
    ports:
      - '389:389'
      - '636:636'
    volumes:
      - './data/etc:/etc/openldap:ro'
      - './data/var:/var/lib/openldap:Z'
```
