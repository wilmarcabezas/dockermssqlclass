# Definir la imagen base
FROM mcr.microsoft.com/mssql/server:2019-latest

# Etiqueta para mantener la coherencia
LABEL maintainer="wilmar.cabezas@gmail.com"

# Variables de entorno para configurar SQL Server
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=123ABC!345aaa

# Puerto que se expondrá en el contenedor
EXPOSE 1433

# Copiar el archivo .sql al directorio raíz llamado "sqldata" en la imagen
COPY FEVRIPS-script.sql /sqldata/

# Ejecutar el archivo .sql en el motor de la base de datos al iniciar el contenedor
#CMD /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 123ABC!345aaa -d master -i /sqldata/FEVRIPS-script.sql


# Comando para ejecutar SQL Server en modo demonio (background)
#CMD [ "sqlservr" ]

# Ejecutar sqlcmd una vez que SQL Server esté en funcionamiento
# Este comando se ejecutará solo durante la construcción de la imagen, no durante la ejecución del contenedor.
#RUN /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 123ABC!345aaa -Q "SELECT @@VERSION"

#docker run --name sqlserver -p 1433:1433 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=123ABC!345aaa' -d  mcr.microsoft.com/mssql/server:2019-latest