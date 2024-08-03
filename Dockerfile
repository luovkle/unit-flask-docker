FROM unit:1.32.1-python3.12
COPY ["./pyproject.toml", "./README.rst", "/www/"]
COPY ["./flaskr", "/www/flaskr/"]
RUN python3 -m pip install -e /www/
RUN flask --app flaskr init-db
COPY ["./unit/config.json", "/docker-entrypoint.d/config.json"]
EXPOSE 80
