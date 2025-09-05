FROM postgres:latest

COPY DDL_CalendarioLaboral.sql /docker-entrypoint-initdb.d/
COPY DML_CalendarioLaboral.sql /docker-entrypoint-initdb.d/

