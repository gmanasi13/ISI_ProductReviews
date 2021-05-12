FROM postgres:latest
ENV POSTGRES_PASSWORD=secret
ENV POSTGRES_USER=postgres
ENV POSTGRES_DB=isi
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
EXPOSE 5432
